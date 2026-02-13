variable environment {
    type = string
    default = "dev"
    description = "Environment"
}

variable "ec2_tags" {
    type = map(string)
    default = {
        Name = "Hemanth-EC2"
        terraform = "true"
        environment = "dev"
        project = "terraform"
    }
    description = "EC2 Tags"
}

variable "ami_id" {
    type = string
    default = "ami-0220d79f3f480ecf5"
    description = "AMI ID"
}