resource "aws_instance" "ec2" {
    ami = var.ami_id
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.Terraform-sg1.id]
    tags = var.ec2_tags

}

resource "aws_security_group" "Terraform-sg1" {
    name = "Terraform-sg1"
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