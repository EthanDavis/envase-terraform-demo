
resource "aws_elastic_beanstalk_environment" "beanstalk_env" {
  application         = var.application_name
  name                = var.environment_name
  solution_stack_name = var.solution_stack_name
  tier                = var.tier
  tags                = var.tags

  setting {
    namespace = "aws:ec2:vpc"
    name      = "VPCId"
    value     = var.vpc_id
    resource  = ""
  }

  setting {
    namespace = "aws:ec2:vpc"
    name      = "Subnets"
    value     = var.subnets
    resource  = ""
  }

  setting {
    namespace = "aws:ec2:vpc"
    name      = "AssociatePublicIpAddress"
    value     = var.enable_public_ip
    resource  = ""
  }

  setting {
    namespace = "aws:ec2:vpc"
    name      = "ELBSubnets"
    value     = var.elb_subnets
    resource  = ""
  }

  setting {
    namespace = "aws:ec2:vpc"
    name      = "ELBScheme"
    value     = var.elb_scheme
    resource  = ""
  }

  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "EnvironmentType"
    value     = var.environment_type
    resource  = ""
  }

  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "LoadBalancerType"
    value     = var.lb_type
    resource  = ""
  }

  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "ServiceRole"
    value     = var.service_role
    resource  = ""
  }

  setting {
    namespace = "aws:elasticbeanstalk:command"
    name      = "DeploymentPolicy"
    value     = var.deployment_policy
    resource  = ""
  }

  setting {
    namespace = "aws:elasticbeanstalk:command"
    name      = "IgnoreHealthCheck"
    value     = "false"
    resource  = ""
  }

  setting {
    namespace = "aws:ec2:instances"
    name      = "InstanceTypes"
    value     = var.instance_types
    resource  = ""
  }

  setting {
    namespace = "aws:cloudformation:template:parameter"
    name      = "InstanceTypeFamily"
    value     = var.instance_type_family
    resource  = ""
  }

  setting {
    namespace = "aws:cloudformation:template:parameter"
    name      = "InstancePort"
    value     = var.instance_port
    resource  = ""
  }

  setting {
    namespace = "aws:ec2:instances"
    name      = "SpotFleetOnDemandAboveBasePercentage"
    value     = "70"
    resource  = ""
  }

  setting {
    namespace = "aws:autoscaling:asg"
    name      = "MinSize"
    value     = var.auto_scaling_min
    resource  = ""
  }

  setting {
    namespace = "aws:autoscaling:asg"
    name      = "MaxSize"
    value     = var.auto_scaling_max
    resource  = ""
  }

  setting {
    namespace = "aws:autoscaling:asg"
    name      = "Availability Zones"
    value     = var.availability_zone
    resource  = ""
  }

  ###=========================== Load Balancer Settings ========================== ###

  setting {
    name      = "CrossZone"
    namespace = "aws:elb:loadbalancer"
    value     = var.enable_cross_zone_lb
    resource  = ""
  }

  setting {
    namespace = "aws:elasticbeanstalk:xray"
    name      = "XRayEnabled"
    value     = "true"
  }

  setting {
    namespace = "aws:elbv2:listener:443"
    name      = "Protocol"
    value     = "HTTPS"
  }

  setting {
    namespace = "aws:elbv2:listener:443"
    name      = "SSLCertificateArns"
    value     = var.ssl_cert
  }
  ###=========================== AutoScale Launch Settings ========================== ###

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "ImageId"
    value     = var.ami_id
    resource  = ""
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "MonitoringInterval"
    value     = "5 minute"
    resource  = ""
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "InstanceType"
    value     = var.auto_scaling_instance_type
    resource  = ""
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     = var.auto_scaling_iam_instance_role
    resource  = ""
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "SSHSourceRestriction"
    value     = var.ssh_source_restriction
    resource  = ""
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "EC2KeyName"
    value     = var.key_pair
    resource  = ""
  }

  ###=========================== Autoscale trigger ========================== ###

  setting {
    namespace = "aws:autoscaling:trigger"
    name      = "LowerBreachScaleIncrement"
    value     = var.auto_scaling_scale_down_increment
    resource  = ""
  }

  setting {
    namespace = "aws:autoscaling:trigger"
    name      = "UpperBreachScaleIncrement"
    value     = var.auto_scaling_scale_up_increment
    resource  = ""
  }

  ###=========================== ELB Control Settings ========================== ###

  setting {
    namespace = "aws:elasticbeanstalk:control"
    name      = "DefaultSSHPort"
    value     = var.default_ssh_port
    resource  = ""
  }

  setting {
    namespace = "aws:elasticbeanstalk:control"
    name      = "RollbackLaunchOnFailure"
    value     = var.rollback_on_failure
    resource  = ""
  }

  ###=========================== ELB Policy Settings ========================== ###

  setting {
    namespace = "aws:elasticbeanstalk:cloudwatch:logs"
    name      = "StreamLogs"
    value     = var.enable_stream_logs ? "true" : "false"
    resource  = ""
  }

  setting {
    namespace = "aws:elasticbeanstalk:cloudwatch:logs"
    name      = "DeleteOnTerminate"
    value     = var.logs_delete_on_terminate ? "true" : "false"
    resource  = ""
  }

  setting {
    namespace = "aws:elasticbeanstalk:cloudwatch:logs"
    name      = "RetentionInDays"
    value     = "7"
    resource  = ""
  }

  setting {
    namespace = "aws:elasticbeanstalk:cloudwatch:logs:health"
    name      = "RetentionInDays"
    value     = "7"
    resource  = ""
  }

  setting {
    namespace = "aws:elasticbeanstalk:healthreporting:system"
    name      = "SystemType"
    value     = var.health_reporting_system_type
    resource  = ""
  }

  setting {
    namespace = "aws:elasticbeanstalk:healthreporting:system"
    name      = "HealthCheckSuccessThreshold"
    value     = var.health_check_success_threshold
    resource  = ""
  }

  ###=========================== Health Check Settings ========================== ###
  setting {
    namespace = "aws:elb:healthcheck"
    name      = "Target"
    value     = "TCP:80"
    resource  = ""
  }

  setting {
    namespace = "aws:elb:healthcheck"
    name      = "Timeout"
    value     = "5"
    resource  = ""
  }

  setting {
    namespace = "aws:elb:healthcheck"
    name      = "Interval"
    value     = "10"
    resource  = ""
  }

  ###=========================== Rolling Update Settings ========================== ###
  setting {
    namespace = "aws:autoscaling:updatepolicy:rollingupdate"
    name      = "RollingUpdateEnabled"
    value     = "true"
    resource  = ""
  }

  ###=========================== Application Environment Settings ========================== ###
  dynamic "setting" {
    for_each = var.environment_variables
    content {
      namespace = "aws:elasticbeanstalk:application:environment"
      name      = setting.key
      value     = setting.value
      resource  = ""
    }
  }
}

output "elb_cname" {
  value = aws_elastic_beanstalk_environment.beanstalk_env.cname
}

output "eb_endpoint" {
  value = aws_elastic_beanstalk_environment.beanstalk_env.endpoint_url
}