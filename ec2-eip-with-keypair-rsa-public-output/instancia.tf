resource "aws_instance" "web" {

        ami = "ami-082b5a644766e0e6f"
        instance_type = "t2.micro"
        key_name = "${aws_key_pair.keypair.key_name}"

 vpc_security_group_ids = [ "${aws_security_group.allow_ssh_anywhere.id}" ]

}

