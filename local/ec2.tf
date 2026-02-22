resource "aws_instance" "ec2" {
    ami = local.ami_id  
    instance_type = local.instance_type
    vpc_security_group_ids = [aws_security_group.Terraform-sg1.id]
    tags = local.ec2_tags

}

resource "aws_security_group" "Terraform-sg1" {
    name = "${local.common_name}-"
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