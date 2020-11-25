resource "aws_instance" "web" {

        ami = "${var.ami_id}"
        instance_type = "${var.instance_type}"
         key_name      = "${var.key_name}"
	user_data = "${ file("user-data.txt") }"

 vpc_security_group_ids = [
        "${aws_security_group.allow_ssh_anywhere.id}" ,
        "${aws_security_group.allow_http_anywhere.id}"]

          tags = {
         Name = "${var.project_name}-instance"
                }
}
