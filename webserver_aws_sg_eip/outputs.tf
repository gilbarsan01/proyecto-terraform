output "sg_id" {
  value = "${aws_security_group.sg.id}"
}

output "eip" {
  value = "${aws_eip.eip.public_ip}"
}

output "ips" {
  value = "${ list(aws_eip.eip.private_ip,aws_eip.eip.public_ip) }"
}


output "private_ip"{
  value = "${aws_instance.web.private_ip}"
}

#Se agrega cadena de conexion ssh
output "string_ssh" {
  value = " ssh  -l ubuntu ${aws_eip.eip.public_dns} -i ec2-amazon01.pem"
}
