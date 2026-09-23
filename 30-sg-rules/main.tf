
##### MONGODB SG RULES#####
#mongodb accepting connection from bastion
resource "aws_security_group_rule" "mongodb_bastion" {
    type              = "ingress"
    security_group_id = local.mongodb_sg_id
    source_security_group_id = local.bastion_sg_id
    from_port         = 22
    protocol          = "tcp"
    to_port           = 22
}

#mongodb accepting connection from catalogue
resource "aws_security_group_rule" "mongodb_catalogue" {
    type              = "ingress"
    security_group_id = local.mongodb_sg_id
    source_security_group_id = local.catalogue_sg_id
    from_port         = 27017
    protocol          = "tcp"
    to_port           = 27017
}

#mongodb accepting connection from user
resource "aws_security_group_rule" "mongodb_user" {
    type              = "ingress"
    security_group_id = local.mongodb_sg_id
    source_security_group_id = local.user_sg_id
    from_port         = 27017
    protocol          = "tcp"
    to_port           = 27017
}
#-----------------------------------------------------------

##### REDIS SG RULES#####
#redis accepting connection from bastion
resource "aws_security_group_rule" "redis_bastion" {
    type              = "ingress"
    security_group_id = local.redis_sg_id
    source_security_group_id = local.bastion_sg_id
    from_port         = 22
    protocol          = "tcp"
    to_port           = 22
}

#redis accepting connection from user
resource "aws_security_group_rule" "redis_user" {
    type              = "ingress"
    security_group_id = local.redis_sg_id
    source_security_group_id = local.user_sg_id
    from_port         = 6379
    protocol          = "tcp"
    to_port           = 6379
}

#redis accepting connection from cart
resource "aws_security_group_rule" "redis_cart" {
    type              = "ingress"
    security_group_id = local.redis_sg_id
    source_security_group_id = local.cart_sg_id
    from_port         = 6379
    protocol          = "tcp"
    to_port           = 6379
}
#-----------------------------------------------------------


##### MYSQL SG RULES#####
#mysql accepting connection from bastion
resource "aws_security_group_rule" "mysql_bastion" {
    type              = "ingress"
    security_group_id = local.mysql_sg_id
    source_security_group_id = local.bastion_sg_id
    from_port         = 22
    protocol          = "tcp"
    to_port           = 22
}

#mysql accepting connection from shipping
resource "aws_security_group_rule" "mysql_shipping" {
    type              = "ingress"
    security_group_id = local.mysql_sg_id
    source_security_group_id = local.shipping_sg_id
    from_port         = 3306
    protocol          = "tcp"
    to_port           = 3306
}
#-----------------------------------------------------------


##### RABBITMQ SG RULES#####
#rabbitmq accepting connection from bastion
resource "aws_security_group_rule" "rabbitmq_bastion" {
    type              = "ingress"
    security_group_id = local.rabbitmq_sg_id
    source_security_group_id = local.bastion_sg_id
    from_port         = 22
    protocol          = "tcp"
    to_port           = 22
}

#rabbitmq accepting connection from payment
resource "aws_security_group_rule" "rabbitmq_payment" {
    type              = "ingress"
    security_group_id = local.rabbitmq_sg_id
    source_security_group_id = local.payment_sg_id
    from_port         = 5672
    protocol          = "tcp"
    to_port           = 5672
}
#-----------------------------------------------------------


##### CATALOGUE SG RULES#####
#catalogue accepting connection from bastion
resource "aws_security_group_rule" "catalogue_bastion" {
    type              = "ingress"
    security_group_id = local.catalogue_sg_id
    source_security_group_id = local.bastion_sg_id
    from_port         = 22
    protocol          = "tcp"
    to_port           = 22
}

#catalogue accepting connection from backend alb
resource "aws_security_group_rule" "catalogue_backend_alb" {
    type              = "ingress"
    security_group_id = local.catalogue_sg_id
    source_security_group_id = local.backend_alb_sg_id
    from_port         = 8080
    protocol          = "tcp"
    to_port           = 8080
}

# This is the mistake we did, cart can't access catalogue directly, it should be through backend ALB
# resource "aws_security_group_rule" "catalogue_cart" {
#   type              = "ingress"
#   security_group_id = local.catalogue_sg_id
#   source_security_group_id = local.cart_sg_id
#   from_port         = 8080
#   protocol          = "tcp"
#   to_port           = 8080
# }
#-----------------------------------------------------------


##### USER SG RULES#####
#user accepting connection from bastion
resource "aws_security_group_rule" "user_bastion" {
    type              = "ingress"
    security_group_id = local.user_sg_id
    source_security_group_id = local.bastion_sg_id
    from_port         = 22
    protocol          = "tcp"
    to_port           = 22
}

#user accepting connection from backend alb
resource "aws_security_group_rule" "user_backend_alb" {
    type              = "ingress"
    security_group_id = local.user_sg_id
    source_security_group_id = local.backend_alb_sg_id
    from_port         = 8080
    protocol          = "tcp"
    to_port           = 8080
}
#-----------------------------------------------------------


##### CART SG RULES#####
#cart accepting connection from bastion
resource "aws_security_group_rule" "cart_bastion" {
    type              = "ingress"
    security_group_id = local.cart_sg_id
    source_security_group_id = local.bastion_sg_id
    from_port         = 22
    protocol          = "tcp"
    to_port           = 22
}

#cart accepting connection from backend alb
resource "aws_security_group_rule" "cart_backend_alb" {
    type              = "ingress"
    security_group_id = local.cart_sg_id
    source_security_group_id = local.backend_alb_sg_id
    from_port         = 8080
    protocol          = "tcp"
    to_port           = 8080
}
#-----------------------------------------------------------


##### SHIPPING SG RULES#####
#shipping accepting connection from bastion
resource "aws_security_group_rule" "shipping_bastion" {
    type              = "ingress"
    security_group_id = local.shipping_sg_id
    source_security_group_id = local.bastion_sg_id
    from_port         = 22
    protocol          = "tcp"
    to_port           = 22
}

#shipping accepting connection from backend alb
resource "aws_security_group_rule" "shipping_backend_alb" {
    type              = "ingress"
    security_group_id = local.shipping_sg_id
    source_security_group_id = local.backend_alb_sg_id
    from_port         = 8080
    protocol          = "tcp"
    to_port           = 8080
}
#-----------------------------------------------------------


##### PAYMENT SG RULES#####
#payment accepting connection from bastion
resource "aws_security_group_rule" "payment_bastion" {
    type              = "ingress"
    security_group_id = local.payment_sg_id
    source_security_group_id = local.bastion_sg_id
    from_port         = 22
    protocol          = "tcp"
    to_port           = 22
}

#payment accepting connection from backend alb
resource "aws_security_group_rule" "payment_backend_alb" {
    type              = "ingress"
    security_group_id = local.payment_sg_id
    source_security_group_id = local.backend_alb_sg_id
    from_port         = 8080
    protocol          = "tcp"
    to_port           = 8080
}

# This is the mistake we did, shipping can't access payment directly, it should be through backend ALB
# resource "aws_security_group_rule" "payment_shipping" {
#   type              = "ingress"
#   security_group_id = local.payment_sg_id
#   source_security_group_id = local.shipping_sg_id
#   from_port         = 8080
#   protocol          = "tcp"
#   to_port           = 8080
# }
#-----------------------------------------------------------


##### BACKENDEND ALB SG RULES#####
#Backend alb accepting traffic from bastion
resource "aws_security_group_rule" "backend_alb_bastion" {
    type              = "ingress"
    security_group_id = local.backend_alb_sg_id
    source_security_group_id = local.bastion_sg_id
    from_port         = 80
    protocol          = "tcp"
    to_port           = 80
}

#Backend alb accepting traffic from cart
resource "aws_security_group_rule" "backend_alb_cart" {
  type              = "ingress"
  security_group_id = local.backend_alb_sg_id
  source_security_group_id = local.cart_sg_id
  from_port         = 80
  protocol          = "tcp"
  to_port           = 80
}

#Backend alb accepting traffic from shipping
resource "aws_security_group_rule" "backend_alb_shipping" {
  type              = "ingress"
  security_group_id = local.backend_alb_sg_id
  source_security_group_id = local.shipping_sg_id
  from_port         = 80
  protocol          = "tcp"
  to_port           = 80
}

#Backend alb accepting traffic from payment
resource "aws_security_group_rule" "backend_alb_payment" {
  type              = "ingress"
  security_group_id = local.backend_alb_sg_id
  source_security_group_id = local.payment_sg_id
  from_port         = 80
  protocol          = "tcp"
  to_port           = 80
}

#backend alb accepting frontend
resource "aws_security_group_rule" "backend_alb_frontend" {
    type              = "ingress"
    security_group_id = local.backend_alb_sg_id
    source_security_group_id = local.frontend_sg_id
    from_port         = 80
    protocol          = "tcp"
    to_port           = 80
}
#-----------------------------------------------------------


##### FRONTEND SG RULES#####
#frontend accepting connection from bastion --. we are keeping FE also in private subnet, only FE ALB in public subnet b/c users are connecting to FE ALB only 
resource "aws_security_group_rule" "frontend_bastion" {
    type              = "ingress"
    security_group_id = local.frontend_sg_id
    source_security_group_id = local.bastion_sg_id
    from_port         = 22
    protocol          = "tcp"
    to_port           = 22
}

#frontend  accepting connection from frontend alb
resource "aws_security_group_rule" "frontend_frontend_alb" {
    type              = "ingress"
    security_group_id = local.frontend_sg_id
    source_security_group_id = local.frontend_alb_sg_id
    from_port         = 80
    protocol          = "tcp"
    to_port           = 80
}
#-----------------------------------------------------------


##### BASTION SG RULES#####
#Bastion accepting traffic from laptop i.e., public(internet)
resource "aws_security_group_rule" "bastion_laptop" {
    type              = "ingress"
    security_group_id = local.bastion_sg_id
    cidr_blocks = ["0.0.0.0/0"]
    from_port         = 22
    protocol          = "tcp"
    to_port           = 22
}
#-----------------------------------------------------------


##### FRONTEND ALB SG RULES#####
#frontend alb accepting traffic from public(internet)
resource "aws_security_group_rule" "frontend_alb_public" {
    type              = "ingress"
    security_group_id = local.frontend_alb_sg_id
    cidr_blocks = ["0.0.0.0/0"]
    from_port         = 443
    protocol          = "tcp"
    to_port           = 443
}
#-----------------------------------------------------------







# This is the mistake we did, cart can't access components directly from one component to another component. they should be communicated through backend ALB
# resource "aws_security_group_rule" "cart_shipping" {
#   type              = "ingress"
#   security_group_id = local.cart_sg_id
#   source_security_group_id = local.shipping_sg_id
#   from_port         = 8080
#   protocol          = "tcp"
#   to_port           = 8080
# }

# resource "aws_security_group_rule" "user_payment" {
#   type              = "ingress"
#   security_group_id = local.user_sg_id
#   source_security_group_id = local.payment_sg_id
#   from_port         = 8080
#   protocol          = "tcp"
#   to_port           = 8080
# }

# resource "aws_security_group_rule" "cart_payment" {
#   type              = "ingress"
#   security_group_id = local.cart_sg_id
#   source_security_group_id = local.payment_sg_id
#   from_port         = 8080
#   protocol          = "tcp"
#   to_port           = 8080
# }












