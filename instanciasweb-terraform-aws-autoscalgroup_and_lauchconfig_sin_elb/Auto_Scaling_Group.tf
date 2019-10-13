resource "aws_autoscaling_group" "web" {
  name                      = "${var.project_name}-web"
  max_size                  = 2
  min_size                  = 0
  desired_capacity          = 0
  launch_configuration      = "${aws_launch_configuration.web.name}"

  #El Auto Scaling Group se generara en las siguientes subnet de la VPC por default.
  vpc_zone_identifier       = [
	"subnet-27eee00f", 
	"subnet-96b995cf" ,
	"subnet-a0cfded7" ,
	"subnet-a7e814c3" 
  ]

  tag {
    key                 = "Name"
    value               = "${var.project_name}-web-asg"
    propagate_at_launch = true
  }


}
