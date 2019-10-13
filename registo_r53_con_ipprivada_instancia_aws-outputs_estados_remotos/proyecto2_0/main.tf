#PROVIDER
provider "aws" {
  region     = "us-west-2"
}


#DATA
data "aws_route53_zone" "selected" {
  name         = "test-dominio-aws.co.mx"
  private_zone = false
}



#Route53   Se realiza el registro DNS con la direccion IP privada de la instancia creada del proyecto1_0
resource "aws_route53_record" "www" {
  zone_id = "${data.aws_route53_zone.selected.zone_id}"
  name    = "web.test-dominio-aws.co.mx"
  type    = "A"
  ttl     = "300"
  records = ["${data.terraform_remote_state.proyecto1_0.outputs.instance_ip_addr}"]
}



#ESTADO REMOTO
terraform {
  backend "s3" {
    bucket = "compartir-outputs-aws"
    key    = "terraform/state/proyecto2_0.tfstate"
    region = "us-west-2"
  }
}

data "terraform_remote_state" "proyecto1_0" {
  backend = "s3"
  config = {
    bucket = "compartir-outputs-aws"
    key    = "terraform/state/proyecto1_0.tfstate"
    region = "us-west-2"
  }
}


#OUTPUT

output "RegistroRoute53_estado_remoto"{
         #value = "${data.terraform_remote_state.proyecto1_0.outputs.instance_ip_addr}"
         value = data.terraform_remote_state.proyecto1_0.outputs.instance_ip_addr
         #ejemplo: subnet_id = data.terraform_remote_state.vpc.outputs.subnet_id
}
