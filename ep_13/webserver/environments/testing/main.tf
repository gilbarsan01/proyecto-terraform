module "webserver" {
  source = "github.com/videocursoscloud/terraform-module-ec2-with-eip?ref=v1.0.2"
  ami = "ami-06f2f779464715dc5"
  instance_type = "t2.micro"
  key_name = "ec2-amazon01"
  vpc_id = "vpc-f8ba509c"
  project_name = "webserver"
  environment = "testing"
}



