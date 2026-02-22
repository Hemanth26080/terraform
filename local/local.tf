locals {
  ami_id = data.aws_ami.DevOps_ami.id
  instance_type = "t3.micro"
  common_name = "${var.project}-${var.environment}"
  ec2_tags = {
    Name = "${local.common_name}-EC2"
    terraform = "true"
    environment = var.environment
    project = var.project
  }
}