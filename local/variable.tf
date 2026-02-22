variable environment {
    type = string
    default = "dev"
    description = "Environment"
}

variable "project" {
    type = string
    default = "roboshop"
    description = "Project"
}

variable "common_name" {
    default = "${var.project}-${var.environment}"
}

variable "ec2_tags" {
    type = map(string)
    default = {
        Name = "${var.common_name}-EC2"
        terraform = "true"
        environment = var.environment
        project = var.project
    }
    description = "EC2 Tags"
}

variable "ami_id" {
    type = string
    default = "ami-0220d79f3f480ecf5"
    description = "AMI ID"
}

variable "instance_type" {
    type = string
    default = "t3.micro"
    description = "Instance Type"
}
