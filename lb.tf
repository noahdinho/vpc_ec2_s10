// 1 target group
resource "aws_lb_target_group" "tgrp" {
  name     = "lb-tget"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vp1.id

  health_check {
    enabled             = true
    healthy_threshold   = 3
    interval            = 100
    matcher             = 200
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 6
    unhealthy_threshold = 3
  }
}

// 2 Attache instance to the target group
resource "aws_lb_target_group_attachment" "tgt1" {
  target_group_arn = aws_lb_target_group.tgrp.arn
  target_id        = aws_instance.My_server01.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "tgt2" {
  target_group_arn = aws_lb_target_group.tgrp.arn
  target_id        = aws_instance.My_server02.id
  port             = 80
}

// 3 load balancer
resource "aws_lb" "loadbcer" {
  name                       = "lb-project"
  internal                   = false
  load_balancer_type         = "application"
  security_groups            = [aws_security_group.sg-demo.id]
  subnets                    = [aws_subnet.public1.id, aws_subnet.private2.id]
  enable_deletion_protection = false

}

// 4 load balance listener

resource "aws_lb_listener" "lb_listener1" {
  load_balancer_arn = aws_lb.loadbcer.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tgrp.arn
  }
}

