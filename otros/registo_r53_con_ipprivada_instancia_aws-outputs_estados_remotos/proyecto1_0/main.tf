#Provider
provider "aws" {
  region     = "us-west-2"
}



#Datasource
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}



#Intancia EC2
resource "aws_instance" "web" {
  ami           = "${data.aws_ami.ubuntu.id}"
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
}




#Elastic Load Balancer
resource "aws_eip" "web" {
  instance = "${aws_instance.web.id}"
}



#Remote state
terraform {
  backend "s3" {
    bucket = "compartir-outputs-aws"
    key    = "terraform/state/proyecto1_0.tfstate"
    region = "us-west-2"
  }
}


#OUTPUTS

output "web_public_ip"{
        value = "${aws_eip.web.public_ip}"
}

output "instance_public_ip"{
 value = "${aws_instance.web.public_ip}"
}

#Obtenemos la direccion privada de la instancia.
output "instance_ip_addr" {
  value = aws_instance.web.private_ip
}


