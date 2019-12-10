# Create a new load balancer
resource "aws_elb" "web" {
  name               = "${var.project_name}-elb-web"
  subnets = [

        "subnet-27eee00f" ,
        "subnet-96b995cf" ,
        "subnet-a0cfded7" ,
        "subnet-a7e814c3"
  ]


  #Se define la lista de los security groups que estaran asosiados al ELB
	 security_groups = [
	"${aws_security_group.allow_http_anywhere.id}"
	 ]


  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

 
  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 2
    target              = "HTTP:80/"
    interval            = 5
  }


  tags = {
    Name = "${var.project_name}-elb-web"
  }
}
