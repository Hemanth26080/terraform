module "ec2" {
    source = "../terraform-module-aws"
    # ami_id = "ami-0220d79f3f480ecf5"
    # instance_type = "t3.micro"
    # sg_ids = [aws_security_group.Terraform-sg.id]
    # tags = {
    #     Name = "terraform-module-aws-test"
    # }

    ami_id = var.ami_id
    instance_type = var.instance_type
    sg_ids = var.sg_ids
    tags = var.tags
}