resource "aws_autoscaling_group" "web" {
  name             = "${var.project_name}-web"
  max_size         = 3
  min_size         = 1
  desired_capacity = 1

  #Auto scaling se apoya en los chequeos de salud del balanceador.
  health_check_type = "ELB"

  #Establece el tiempo de espera en segundos para comenzar a realizar los chequedos.
  health_check_grace_period = 20

  #Se le atacha el Load balancer al Auto Scaling Group.
  load_balancers = [
    "${aws_elb.web.name}"
  ]

  #Se le atacha el Launch Configuration al AutoScalingGroup.
  launch_configuration = "${aws_launch_configuration.web.name}"


  #El Auto Scaling Group se generara en las siguientes subnet de la VPC por default.
  vpc_zone_identifier = [
    "subnet-27eee00f",
    "subnet-96b995cf",
    "subnet-a0cfded7",
    "subnet-a7e814c3"
  ]

  tag {
    key                 = "Name"
    value               = "${var.project_name}-web-asg"
    propagate_at_launch = true
  }


}
