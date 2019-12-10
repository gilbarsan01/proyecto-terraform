data "aws_ami" "ubuntu" {
  filter {
    name   = "state"
    values = ["available"]
  }

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners      = ["099720109477"]
  most_recent = true

}

data "aws_vpc" "selected" {
  default = true
}
