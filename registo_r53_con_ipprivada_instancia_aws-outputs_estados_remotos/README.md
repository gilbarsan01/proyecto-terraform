Author: Gilberto Barraza  gilbarsan@gmail.com

Objetivo: Generar una instancia web y con el output que seria la direccion privada de la instancia generada, se realizará un registro en Route 53 de AWS.
Utilizar los outputs de proyecto1_0 y  tomarlos como variable para usarlos en el proyecto2_0  


Acceder a los proyecto:
cd proyecto1_0
cd proyecto2_0


Inicializar proyectos:
proyecto1_0/$ terraform init
proyecto2_0/$ terraform init



------VALORES A MODIFICAR A CONSIDERACIÓN----

Declarar  los valores del bucket S3 para guardar el estado:
proyecto1_0/main.tf

#Remote state
terraform {
  backend "s3" {
    bucket = "compartir-outputs-aws"
    key    = "terraform/state/proyecto1_0.tfstate"
    region = "us-west-2"
  }
}



Definir los valores del proyecto al que se tendrá acceso para hacer uso del estado remoto del proyecto.
Valores a definir: proyecto1_0
bucket s3: compartir-outputs-aws
nombre del fichero al cual se va acceder:  key    = "terraform/state/proyecto1_0.tfstate"
uso de la variable del registro DNS:   records = ["${data.terraform_remote_state.proyecto1_0.outputs.instance_ip_addr}"]


proyecto2_0/main.tf


#Route53   Se realiza el registro DNS con la dirección IP privada de la instancia creada del proyecto1_0
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

------VALORES A MODIFICAR A CONSIDERACIÓN----


Aplicar cambios:
proyecto1_0/$ terraform apply --auto-approve
proyecto2_0/$ terraform apply --auto-approve



Destruir infraestructura:
proyecto1_0/$ terraform destroy --auto-approve
proyecto2_0/$ terraform destroy --auto-approve



