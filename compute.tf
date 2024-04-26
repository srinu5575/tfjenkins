data "aws_ami" "myec2machine" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}


resource "aws_security_group" "web" {
  name        = "web-server-sg"
  description = "Security group for web server"

  // Add inbound rules to allow HTTP and SSH traffic
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] // Restrict SSH access to your IP
  }

}

resource "aws_instance" "mymachine" {
  ami                         = data.aws_ami.myec2machine.id
  associate_public_ip_address = true
  availability_zone           = var.azs[0]
  instance_type               = "t2.micro"
  tags = {
    "name" = "myec2"
    "env"  = "test"
  }


}


output "instanceip" {
  value = aws_instance.mymachine.public_ip
}