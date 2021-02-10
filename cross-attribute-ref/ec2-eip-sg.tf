provider "aws" {
    region = "us-east-1"
}

resource "aws_security_group" "allow_ssh" {
  name        = "testing-v0.12"

  ingress {
    from_port   = var.ssh_port
    to_port     = var.ssh_port
    protocol    = "tcp"
    cidr_blocks = ["${aws_eip.bastion.public_ip}/32"]
  }
}

resource "aws_eip" "bastion" {
  
}

resource "aws_instance" "web" {
    ami = "ami-047a51fa27710816e"
    instance_type = "t2.micro"
}

resource "aws_eip" "webip" {
    instance = aws_instance.web.id
  
}

resource "aws_network_interface_sg_attachment" "sg_attachment" {
  security_group_id    = aws_security_group.allow_ssh.id
  network_interface_id = aws_instance.web.primary_network_interface_id
}

output "web_ip" {
  value = aws_eip.webip.public_ip
  
}
