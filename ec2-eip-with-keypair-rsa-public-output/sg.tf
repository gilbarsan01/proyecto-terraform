#Generar security group en VPC por default.
# el valor vpc_id = "vpc-f8ba509c"  - Es el ID de la VPC por default.

resource "aws_security_group" "allow_ssh_anywhere" {
  name        = "allow_ssh_anywhere"
  description = "Allow all  inbound traffic ssh"
  vpc_id      = "vpc-f8ba509c"

  ingress {
    # TLS (change to whatever ports you need)
    from_port   = 22
    to_port     = 22
        protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}

