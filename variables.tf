variable "region" {}
variable "vpc" {}
variable "ig" {}
variable "jumpbox-subnet" {}
variable "private-subnet" {}
variable "rt-jumpbox" {}
variable "rt-private" {}


variable "sg-jumpbox" {}
variable "sg-rds" {}


variable "ami" {}
variable "instance_type" {}
variable "key_name" {}
variable "startup_script" {}


variable "jumpbox-cidr" {}

variable "vpc-cidr" {}
variable "az" {}


variable "availability_zones" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1b"]
}