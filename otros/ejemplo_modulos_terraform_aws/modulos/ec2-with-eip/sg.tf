resource "aws_security_group" "sg" {
  # Se coloca el name_prefix para que se genere un prefijo con un time stamp
  name_prefix = "${var.project_name}-${var.environment}-"
  description = "Security Group for ${var.project_name}-${var.environment}"
  vpc_id      = "${var.vpc_id}"

  ingress {
    # TLS (change to whatever ports you need)
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    # Please restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    cidr_blocks = ["0.0.0.0/0"] # add a CIDR block here
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Se crea recurso Security Group y despues se destroye.
  lifecycle {
    create_before_destroy = true
  }

}
