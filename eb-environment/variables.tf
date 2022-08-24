variable "environment_name" {}
variable "application_name" {}
variable "tier" {
  default = "WebServer"
}
variable "vpc_id" {}
variable "enable_public_ip" {}
variable "environment_type" {}
variable "lb_type" {
  default = "application"
}
variable "key_pair" {}
variable "ami_id" {}
variable "auto_scaling_instance_type" {}
variable "instance_type_family" {}
variable "instance_types" {}
variable "enable_cross_zone_lb" {}
variable "solution_stack_name" {}
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
variable "service_role" {
  default = "arn:aws:iam::061940521405:role/aws-elasticbeanstalk-service-role"
}
variable "deployment_policy" {
  default = "Rolling"
}
variable "batch_size_type" {
  default = "Percentage"
}
variable "batch_size" {
  default = "100"
}
variable "timeout" {
  default = "600"
}
variable "instance_port" {
  default = "80"
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
variable "auto_scaling_upper_threshold" {
  default = "6000000"
}
variable "auto_scaling_lower_threshold" {
  default = "2000000"
}
variable "auto_scaling_trigger_unit_type" {
  default = "Bytes"
}
variable "default_ssh_port" {
  default = "22"
}
variable "rollback_on_failure" {
  default = "true"
}
variable "connection_idle_time_out" {
  default = "60"
}
variable "connection_draining_timeout" {
  default = "20"
}
variable "connection_draining_enabled" {
  default = "false"
}
variable "elb_instance_port" {
  default = "80"
}
variable "health_reporting_system_type" {
  default = "enhanced"
}
variable "health_check_success_threshold" {
  default = "OK"
}
variable "unhealthy_threshold" {
  default = "5"
}
variable "healthy_threshold" {
  default = "3"
}
variable "enable_log_publication_control" {
  default = "false"
}
variable "enable_stream_logs" {
  default = "true"
}
variable "logs_delete_on_terminate" {
  default = "false"
}
#================ Application Environment Variable ================#
variable "environment_variables" {
  type = map(string)
}
