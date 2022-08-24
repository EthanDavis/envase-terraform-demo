variable "vpc_id" {
  default = "vpc-0f734566" // this would be your VPC
}
variable "enable_cross_zone_lb" {
  default = false
}
variable "subnets" {}
variable "environment" {}
