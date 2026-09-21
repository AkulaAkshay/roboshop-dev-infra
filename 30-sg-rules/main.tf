#Backend alb accepting traffic from bastion
resource "aws_security_group_rule" "backend_alb_bastion" {
    type              = "ingress"
    security_group_id = local.backend_alb_sg_id
    source_security_group_id = local.bastion_sg_id
    from_port         = 80
    protocol          = "tcp"
    to_port           = 80
}


#Bastion accepting traffic from laptop i.e., public(internet)
resource "aws_security_group_rule" "bastion_laptop" {
    type              = "ingress"
    security_group_id = local.bastion_sg_id
    cidr_blocks = ["0.0.0.0/0"]
    from_port         = 22
    protocol          = "tcp"
    to_port           = 22
}

#mongodb accepting connection from bastion
resource "aws_security_group_rule" "mongodb_bastion" {
    type              = "ingress"
    security_group_id = local.mongodb_sg_id
    source_security_group_id = local.bastion_sg_id
    from_port         = 22
    protocol          = "tcp"
    to_port           = 22
}

#redis accepting connection from bastion
resource "aws_security_group_rule" "redis_bastion" {
    type              = "ingress"
    security_group_id = local.redis_sg_id
    source_security_group_id = local.bastion_sg_id
    from_port         = 22
    protocol          = "tcp"
    to_port           = 22
}

#rabbitmq accepting connection from bastion
resource "aws_security_group_rule" "rabbitmq_bastion" {
    type              = "ingress"
    security_group_id = local.rabbitmq_sg_id
    source_security_group_id = local.bastion_sg_id
    from_port         = 22
    protocol          = "tcp"
    to_port           = 22
}

#mysql accepting connection from bastion
resource "aws_security_group_rule" "mysql_bastion" {
    type              = "ingress"
    security_group_id = local.mysql_sg_id
    source_security_group_id = local.bastion_sg_id
    from_port         = 22
    protocol          = "tcp"
    to_port           = 22
}

#catalogue accepting connection from bastion
resource "aws_security_group_rule" "catalogue_bastion" {
    type              = "ingress"
    security_group_id = local.catalogue_sg_id
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

#catalogue accepting connection from backend alb
resource "aws_security_group_rule" "catalogue_backend_alb" {
    type              = "ingress"
    security_group_id = local.catalogue_sg_id
    source_security_group_id = local.backend_alb_sg_id
    from_port         = 8080
    protocol          = "tcp"
    to_port           = 8080
}

#frontend alb accepting traffic from public(internet)
resource "aws_security_group_rule" "frontend_alb_public" {
    type              = "ingress"
    security_group_id = local.frontend_alb_sg_id
    cidr_blocks = ["0.0.0.0/0"]
    from_port         = 443
    protocol          = "tcp"
    to_port           = 443
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

#mysql accepting connection from shipping
resource "aws_security_group_rule" "mysql_shipping" {
    type              = "ingress"
    security_group_id = local.mysql_sg_id
    source_security_group_id = local.shipping_sg_id
    from_port         = 3306
    protocol          = "tcp"
    to_port           = 3306
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

#user accepting connection from backend alb
resource "aws_security_group_rule" "user_backend_alb" {
    type              = "ingress"
    security_group_id = local.user_sg_id
    source_security_group_id = local.backend_alb_sg_id
    from_port         = 8080
    protocol          = "tcp"
    to_port           = 8080
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

#shipping accepting connection from backend alb
resource "aws_security_group_rule" "shipping_backend_alb" {
    type              = "ingress"
    security_group_id = local.shipping_sg_id
    source_security_group_id = local.backend_alb_sg_id
    from_port         = 8080
    protocol          = "tcp"
    to_port           = 8080
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

#backend alb accepting frontend
resource "aws_security_group_rule" "backend_alb_frontend" {
    type              = "ingress"
    security_group_id = local.backend_alb_sg_id
    source_security_group_id = local.frontend_sg_id
    from_port         = 80
    protocol          = "tcp"
    to_port           = 80
}

#frontend alb accepting frontend alb
resource "aws_security_group_rule" "frontend_frontend_alb_" {
    type              = "ingress"
    security_group_id = local.frontend_sg_id
    source_security_group_id = local.frontend_alb_sg_id
    from_port         = 80
    protocol          = "tcp"
    to_port           = 80
}