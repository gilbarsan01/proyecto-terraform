Procedimiento aplicar proyecto:

Acceder al proyecto instanciasweb-terraform-aws-asg-and-lc-with-lb
$cd instanciasweb-terraform-aws-asg-and-lc-with-lb


-Agregar los ficheros keypair-public.tf  y provider.tf :

-Modificar fichero provider.tf :

provider "aws" {
  region     = "us-west-2"
  access_key = "XXXXXXXXX"
  secret_key = "XXXXXXXXX"
}



-Modificar fichero keypair-public.tf : 
#Se declara el keypair para la conexión a la instancia.

resource "aws_key_pair" "keypair" {
  key_name   = "${var.project_name}-keypair"

  public_key = "ssh-rsa XXXXXXXXXX user@host"
}


-Inicializar proyecto:
terraform init


-Planificación del proyecto:
terraform plan


-Levantar Infraestructura:
terraform apply
