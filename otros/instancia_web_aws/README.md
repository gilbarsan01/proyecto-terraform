Author:  Gilberto Barraza gilbarsan@gmail.com

Objetivo:
1.- Verificar las credenciales AWS
2- Configurar ficheros terraform.
3. Inicializar proyecto Terraform
4- Levantar Infraestructura.
5.-Verificar Acceso  



1- Verificar las credenciales AWS
aws configure


2- Configurar ficheros terraform.
Modificar el fichero keypair.tf  con  los siguientes datos:

cat  /home/gilbarsan/.ssh/id_rsa.pub   
ssh-rsa XXX user@equipo



3. Inicializar proyecto Terraform
$terraform  init 


4- Levantar Infraestructura.
$terraform  plan
$terraform apply  --auto-approve

aws_key_pair.keypair: Creating...
aws_security_group.allow_ssh_anywhere: Creating...
aws_security_group.allow_http_anywhere: Creating...
aws_key_pair.keypair: Creation complete after 1s [id=terraform-test01-keypair]
aws_security_group.allow_http_anywhere: Creation complete after 4s [id=sg-0e66783e34faff17a]
aws_security_group.allow_ssh_anywhere: Creation complete after 5s [id=sg-081dc92b5f2372a43]
aws_instance.web: Creating...
aws_instance.web: Still creating... [10s elapsed]
aws_instance.web: Still creating... [20s elapsed]
aws_instance.web: Still creating... [30s elapsed]
aws_instance.web: Creation complete after 31s [id=i-06c66857fce52d64d]
aws_eip.web_eip: Creating...
aws_eip.web_eip: Creation complete after 5s [id=eipalloc-0fe08961145ee58a0]

Apply complete! Resources: 5 added, 0 changed, 0 destroyed.

Outputs:

instance_public_eip = 54.202.30.60
instance_public_ip = 34.213.32.165
security_group_description = Allow all  inbound traffic ssh
security_group_id = sg-081dc92b5f2372a43
security_group_name = terraform-test01-allow_ssh_anywhere


Conectar al servidor:
gilbarsan@HP-Pavilion-17-Notebook:~/Documentos/repositorios/instancia_web_aws$ ssh -l ec2-user 54.202.30.60
The authenticity of host '54.202.30.60 (54.202.30.60)' can't be established.
ECDSA key fingerprint is SHA256:NbSoP21qIBy/+OTne7sB38Jn7Wy+0C5YvBm74fAt+4E.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added '54.202.30.60' (ECDSA) to the list of known hosts.

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
6 package(s) needed for security, out of 17 available
Run "sudo yum update" to apply all updates.
[ec2-user@ip-172-31-17-197 ~]$ 




Verificar la pagina web:
Ejemplo:
http://34.223.186.65/
Hola mundo



6.- Destruir infraestructura
$ terraform destroy --auto-approve
aws_security_group.allow_ssh_anywhere: Refreshing state... [id=sg-081dc92b5f2372a43]
aws_key_pair.keypair: Refreshing state... [id=terraform-test01-keypair]
aws_security_group.allow_http_anywhere: Refreshing state... [id=sg-0e66783e34faff17a]
aws_instance.web: Refreshing state... [id=i-06c66857fce52d64d]
aws_eip.web_eip: Refreshing state... [id=eipalloc-0fe08961145ee58a0]
aws_eip.web_eip: Destroying... [id=eipalloc-0fe08961145ee58a0]
aws_eip.web_eip: Destruction complete after 2s
aws_instance.web: Destroying... [id=i-06c66857fce52d64d]
aws_instance.web: Still destroying... [id=i-06c66857fce52d64d, 10s elapsed]
aws_instance.web: Still destroying... [id=i-06c66857fce52d64d, 20s elapsed]
aws_instance.web: Destruction complete after 22s
aws_key_pair.keypair: Destroying... [id=terraform-test01-keypair]
aws_security_group.allow_http_anywhere: Destroying... [id=sg-0e66783e34faff17a]
aws_security_group.allow_ssh_anywhere: Destroying... [id=sg-081dc92b5f2372a43]
aws_key_pair.keypair: Destruction complete after 0s
aws_security_group.allow_ssh_anywhere: Destruction complete after 1s
aws_security_group.allow_http_anywhere: Destruction complete after 1s

Destroy complete! Resources: 5 destroyed.


