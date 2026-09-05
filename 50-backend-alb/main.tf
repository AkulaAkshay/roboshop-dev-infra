resource "aws_lb" "backend_alb" {
  name               = "${local.common_name_suffix}-backend-alb" #roboshop-dev-backend-alb
  internal           = true
  load_balancer_type = "application"
  security_groups    = [local.backend_alb_sg_id]
  subnets            = local.private_subnet_id

  enable_deletion_protection = true #prevents accidental deletion from UI

  tags = merge (
    local.common_tags,
    {
        Name = "${var.project_name}-${var.environment}-backend-alb"
    }
  )
}

#backend alb listening on port no 80 (listener)
resource "aws_lb_listener" "backend_alb" {
  load_balancer_arn = aws_lb.backend_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action { #since target group is not created, inorder to just test the backend_alb we use this
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "Hi iam from Backend ALB HTTP"
      status_code  = "200"
    }
  }
}