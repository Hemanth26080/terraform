resource "aws_instance" "terraform" {
  for_each               = toset(var.instance)
  ami                    = "ami-0220d79f3f480ecf5"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.Terraform-sg.id]
  tags = {
    Name        = each.key
    terraform   = "true"
    environment = "dev"
    project     = "terraform"
  }

}

resource "aws_security_group" "Terraform-sg" {
  name        = "Terraform-sg"
  description = "Created by terraform"
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
