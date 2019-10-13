module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "2.15.0"

  name = "my-vpc"
  cidr = "192.168.0.0/16"

  azs             = ["us-west-2a", "us-west-2b", "us-west-2c"]
  private_subnets = ["192.168.1.0/24", "192.168.2.0/24", "192.168.3.0/24"]
  public_subnets  = ["192.168.10.0/24", "192.168.20.0/24", "192.168.30.0/24"]

  enable_vpn_gateway = false
  enable_nat_gateway = false

  tags = {
    Terraform = "true"
    Environment = "testing"
  }
}

module "webserver" {
  source  = "github.com/gilbarsan01/terraform-module-ec2-with-eip?ref=v1.0.2"
  #version = "1.0.2"

  ami = "ami-06f2f779464715dc5"
  instance_type = "t2.micro"
  key_name = "ec2-amazon01"
  vpc_id = "${module.vpc.vpc_id}"
  subnet_id = "${element(module.vpc.public_subnets,0)}"
  project_name = "webserver"
  environment = "testing"
  
}
