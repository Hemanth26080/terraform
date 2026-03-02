resource "aws_instance" "ec2" {
    ami = "ami-0220d79f3f480ecf5"
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.Terraform-sg.id]
    tags = merge(
        local.common_tags,
        {
            Name = "${local.common_name}-tfvars-multi-env"
        }
    )  

}

resource "aws_security_group" "Terraform-sg" {
    name = "${local.common_name}-Terraform-sg"
    description = "Created by terraform"
    ingress {
        from_port = 0
        to_port = 0   
        protocol = "-1" 
        cidr_blocks = ["0.0.0.0/0"] 
    }
    egress {
        from_port = 0  
        to_port = 0   
        protocol = "-1" 
        cidr_blocks = ["0.0.0.0/0"] 
    }
}