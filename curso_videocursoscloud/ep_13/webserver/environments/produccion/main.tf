module "webserver" {
  source = "github.com/gilbarsan01/terraform-module-ec2-with-eip?ref=v1.0.2"
  ami = "ami-06f2f779464715dc5"
  instance_type = "t2.micro"
  key_name = "ec2-amazon01"
  vpc_id = "vpc-f8ba509c"
  subnet_id = "subnet-96b995cf"
  project_name = "webserver"
  environment = "produccion"
}



