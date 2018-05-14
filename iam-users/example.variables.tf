variable "access_key" {
     description = "AWS access key."
     default = "your-aws-key-id"
}

variable "secret_key" {
    description = "AWS secret key."
    default = "your-secret-key"
}

variable "ec2_iam_user" {
     description="test ec2 iam user"
     default="grabuser"
}

variable "region" {
    description = "default AWS region."
    default = "eu-central-1"
}

variable "key_name" {
    description = "The AWS SSH key pair to use for EC2 instance resources."
    default="euroadmin"
}
