

output "instance_public_eip"{
        value = "${aws_eip.web_eip.public_ip}"
}

output "instance_public_ip"{
        value = "${aws_instance.web.public_ip}"
}


output "security_group_id"{
        value = "${aws_security_group.allow_ssh_anywhere.id}"
}

output "security_group_name"{
        value = "${aws_security_group.allow_ssh_anywhere.name}"
}

output "security_group_description"{
        value = "${aws_security_group.allow_ssh_anywhere.description}"
}

output "ssh_connection_eip_public"{
        value = "ssh  -l ec2-user ${aws_eip.web_eip.public_ip}"
}