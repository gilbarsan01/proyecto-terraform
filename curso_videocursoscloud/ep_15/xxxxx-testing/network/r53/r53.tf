resource "aws_route53_zone" "private-testing" {
  name = "test01-dominio-aws.co.mx"

  vpc {
    vpc_id = "${data.terraform_remote_state.vpc.vpc_id}"
  }
}

