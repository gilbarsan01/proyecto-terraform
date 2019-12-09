output "ELB_IP" {
  value = "${aws_elb.web_elb.dns_name}"
}