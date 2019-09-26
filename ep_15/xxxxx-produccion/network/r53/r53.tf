resource "aws_route53_zone" "private-testing" {
  name = "produccion.videocursoscloud.co.uk"

  vpc {
    vpc_id = "${data.terraform_remote_state.vpc.vpc_id}"
  }
}

