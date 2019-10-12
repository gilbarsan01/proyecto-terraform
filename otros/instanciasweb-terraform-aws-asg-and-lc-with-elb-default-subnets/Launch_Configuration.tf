resource "aws_launch_configuration" "web" {
  name_prefix          = "${var.project_name}-lauch_config-web"  #el valor name_prefix permite realizar cambios,eliminar sobre el que se haya generado.
  image_id      = "${data.aws_ami.ubuntu.id}"
  instance_type = "${var.instance_type}"
  key_name = "${aws_key_pair.keypair.key_name}"			# Permite asociarle una key al lauch configuration 

  #Se define la lista de los security groups que estaran asosiados al lauch configuracion
   security_groups = [
		"${aws_security_group.allow_ssh_anywhere.id}", 
		"${aws_security_group.allow_http_anywhere.id}"
		]

  # Se define el user-data que utilizara el lauch configuration
  #user_data = "${ file("user-data.txt") }"
  user_data = "${data.template_file.user-data.rendered}"	

  #Primero se crea el lauch configuration y despues se le atacha al AutoScalingGroup.
  lifecycle {
    create_before_destroy = true
  }


}
