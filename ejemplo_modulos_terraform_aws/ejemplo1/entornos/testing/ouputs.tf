
output "connection_string" {
  value = "ssh -l ubuntu  ${module.ec2.eip} -i ec2-amazon01.pem"
}
