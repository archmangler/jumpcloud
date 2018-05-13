variable "access_key" {
     description = "AWS access key."
     default = "your aws access key"
}

variable "stack" {
     description="The canonical name of your application stack"
     default = "jumpcloud"
}

variable "secret_key" {
    description = "AWS secret key."
    default = "your aws secret key"
}

variable "region" {
    description = "default AWS region."
    default = "eu-central-1"
}

variable "ami" {
  type    = "map"
  default = {
#   eu-central-1 = "ami-5055cd3f"
    eu-central-1 = "ami-870d206c"
    eu-west-1    = "ami-1b791862"
    us-west-2    = "ami-32e7464a"
    us-east-1    = "ami-66506c1c"
  }
  description = "AMI IDs for Ubuntu 16.04 in various regions"
}

variable "base_instance_type" {
  default     = "t2.micro"
  description = "default instance type for base infrastructure"
}

variable "instance_type" {
  default     = "t2.micro"
  description = "The instance type to launch "
}

variable "instance_ips" {
     description = "The IPs to use for our instances"
     default = ["10.0.1.23"]
}

variable "key_name" {
    description = "The AWS SSH key pair to use for EC2 instance resources."
    default="euroadmin"
}
