provider "aws" {
  region = "us-east-2"
}

terraform {
  backend "s3" {
    bucket = "poc-terraformstate" # This would be your S3 state bucket
    region = "us-east-2"
  }
}

# lookup IAM role used by service
data "aws_iam_role" "service_role" {
  name = "aws-elasticbeanstalk-service-role"
}

# lookup acm certificate used for load balancer CNAME
data "aws_acm_certificate" "site_cert" {
  domain = "*.tigrisconsulting.cloud" // This would be your acm cert
}

# Lookup latest Elastic Beanstalk Stack
data "aws_elastic_beanstalk_solution_stack" "node_latest" {
  most_recent = true

  name_regex = "^64bit Amazon Linux (.*) running Node.js (.*)$"
}

// Create Elastic Beanstalk Application
resource "aws_elastic_beanstalk_application" "demo_elb_app" {
  count = (var.environment == "non-prod") ? 1 : 0
  name  = "envase-tf-demo"
}

data "aws_elastic_beanstalk_application" "demo_elb_app" {
  name  = "envase-tf-demo"
}

// Create key pair
resource "tls_private_key" "public_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  depends_on = [
    tls_private_key.public_key
  ]

  key_name   = "Envase_Demo_TF_Key_${var.environment}"
  public_key = tls_private_key.public_key.public_key_openssh
}
# End create key pair

# create Elastic Beanstalk Application
module "demo_eb_app" {
  source     = "./eb-environment"
  depends_on = [
    aws_key_pair.generated_key
  ]

  application_name = (var.environment == "non-prod") ? aws_elastic_beanstalk_application.demo_elb_app[0].name : data.aws_elastic_beanstalk_application.demo_elb_app.name
  ami_id           = "ami-00d7abbc91a25386f"

  vpc_id           = var.vpc_id
  subnets          = var.subnets
  elb_subnets      = var.subnets
  enable_public_ip = true

  lb_type              = "application"
  enable_cross_zone_lb = var.enable_cross_zone_lb
  ssl_cert             = data.aws_acm_certificate.site_cert.arn

  environment_name = "node-app-${var.environment}"
  environment_type = "LoadBalanced"
  key_pair         = aws_key_pair.generated_key.key_name

  solution_stack_name        = data.aws_elastic_beanstalk_solution_stack.node_latest.name
  auto_scaling_instance_type = "t2.small"
  instance_type_family       = "t2,t3"
  instance_types             = "t2.small,t3.micro"

  service_role = data.aws_iam_role.service_role.arn

  environment_variables = {
    PORT = 8080
  }

  tags = {
    Environment = var.environment
    Application = "demo-app"
  }
}

# Setup CNAME Record for load balancer dns
resource "aws_route53_record" "dns" {
  depends_on = [
    module.demo_eb_app
  ]

  name    = var.environment == "prod" ? "api.tigrisconsulting.cloud" : "api-${var.environment}.tigrisconsulting.cloud"
  type    = "CNAME"
  zone_id = "Z00291681UQ6CGJGIY46K"
  ttl     = 300
  records = [
    module.demo_eb_app.elb_cname
  ]
}

output "private_key" {
  value     = tls_private_key.public_key.private_key_pem
  sensitive = true
}