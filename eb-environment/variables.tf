variable "environment_name" {}
variable "application_name" {}
variable "vpc_id" {}
variable "enable_public_ip" {}
variable "environment_type" {}
variable "key_pair" {}
variable "ami_id" {}
variable "auto_scaling_instance_type" {}
variable "instance_type_family" {}
variable "instance_types" {}
variable "solution_stack_name" {}
variable "tier" {
  default = "WebServer"
}
variable "lb_type" {
  default = "application"
}
variable "enable_cross_zone_lb" {
  default = false
}
variable "health_check_path" {
  default = "/health"
}
variable "subnets" {
  type        = string
  description = "comma seperated string of subnets"
}
variable "elb_subnets" {
  type        = string
  description = "comma seperated string of subnets"
}
variable "tags" {
  type = map(any)
}

variable "ssl_cert" {
  description = "arn for acm cert used for ssl"
}
variable "elb_scheme" {
  default = "public"
}
variable "service_role" {}
variable "deployment_policy" {
  default = "Rolling"
}
variable "instance_port" {
  type = number
  default = 8080
}
variable "auto_scaling_min" {
  default = "1"
}
variable "auto_scaling_max" {
  default = "2"
}
variable "availability_zone" {
  default = "ANY"
}
variable "auto_scaling_iam_instance_role" {
  default = "aws-elasticbeanstalk-ec2-role"
}
variable "ssh_source_restriction" {
  default = "tcp,22,22,34.200.4.86/32" //envase vpn cidr
}
variable "auto_scaling_scale_down_increment" {
  default = "-1"
}
variable "auto_scaling_scale_up_increment" {
  default = "1"
}
variable "default_ssh_port" {
  default = "22"
}
variable "rollback_on_failure" {
  default = "true"
}

variable "health_reporting_system_type" {
  default = "enhanced"
}
variable "health_check_success_threshold" {
  default = "OK"
}

variable "enable_stream_logs" {
  default = "true"
}
variable "logs_delete_on_terminate" {
  default = "true"
}
variable "connection_idle_time_out" {
  default = "60"
}
#================ Application Environment Variable ================#
variable "environment_variables" {
  type = map(string)
}
