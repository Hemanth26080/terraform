resource "aws_instance" "ec2" {
    ami = "ami-0220d79f3f480ecf5"
    instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.Terraform-sg.id]
    tags = {
        Name = "Hemanth-EC2"
        terraform = "true"
        environment = "dev"
        project = "terraform"
    }   

    # Run command to create inventory file while creating EC2 instance
    provisioner "local-exec"{
      command = "echo ${self.private_ip} > inventory"
      on_failure = continue
    }

    provisioner "local-exec"{
      command = "echo Instance is destroyed"
      when    = destroy
    }
    # Connection block to connect to EC2 instance
    connection {
      type     = "ssh"
      user     = "ec2-user"
      password = "DevOps321"
      host     = self.public_ip
    }
    # Run command to install nginx while creating EC2 instance
    provisioner "remote-exec" {
      inline = [
        "sudo dnf install nginx -y",
        "sudo systemctl start nginx"
      ]
    }
    # Run command to stop nginx while destroying EC2 instance
    provisioner "remote-exec" {
      inline = [
        "sudo systemctl stop nginx",
        "echo 'successfully stopped nginx server' "
      ]
      when = destroy
    }
}

resource "aws_security_group" "Terraform-sg" {
    name = "Terraform-sg"
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