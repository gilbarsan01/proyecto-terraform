
module "ec2" {
  source       = "../../../modulos/ec2-with-eip/"
  vpc_id       = "vpc-f8ba509c"
  project_name = "web"
  environment  = "produccion"
  ami           = "ami-06f2f779464715dc5"
  instance_type = "t2.micro"
  key_name      = "ec2-amazon01"

}
