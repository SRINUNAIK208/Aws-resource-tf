module "bastion" {
    source = "../../aws-security-group-tf"
    project = "roboshop"
    environment = "dev"
    sg_name = "bastion"
    sg_description = "creating sg for bastion"
    vpc_id = local.vpc_id
    
}
module "mongodb" {
    source = "../../aws-security-group-tf"
    project = "roboshop"
    environment = "dev"
    sg_name = "mongodb"
    sg_description = "creating sg for mongodb"
    vpc_id = local.vpc_id
    
}
module "redis" {
    source = "../../aws-security-group-tf"
    project = "roboshop"
    environment = "dev"
    sg_name = "redis"
    sg_description = "creating sg for redis"
    vpc_id = local.vpc_id
    
}
module "mysql" {
    source = "../../aws-security-group-tf"
    project = "roboshop"
    environment = "dev"
    sg_name = "mysql"
    sg_description = "creating sg for mysql"
    vpc_id = local.vpc_id
    
}
module "rabbitmq" {
    source = "../../aws-security-group-tf"
    project = "roboshop"
    environment = "dev"
    sg_name = "rabbitmq"
    sg_description = "creating sg for rabbitmq"
    vpc_id = local.vpc_id
    
}
module "frontend_alb" {
    source = "../../aws-security-group-tf"
    project = "roboshop"
    environment = "dev"
    sg_name = "frontend_alb"
    sg_description = "creating sg for frontend_alb"
    vpc_id = local.vpc_id
    
}

module "frontend" {
    source = "../../aws-security-group-tf"
    project = "roboshop"
    environment = "dev"
    sg_name = "frontend"
    sg_description = "creating sg for frontend"
    vpc_id = local.vpc_id
    
}

module "backend_alb" {
    source = "../../aws-security-group-tf"
    project = "roboshop"
    environment = "dev"
    sg_name = "backend_alb"
    sg_description = "creating sg for backend_alb"
    vpc_id = local.vpc_id
    
}
module "catalogue" {
    source = "../../aws-security-group-tf"
    project = "roboshop"
    environment = "dev"
    sg_name = "catalogue"
    sg_description = "creating sg for catalogue"
    vpc_id = local.vpc_id
    
}

module "user" {
    source = "../../aws-security-group-tf"
    project = "roboshop"
    environment = "dev"
    sg_name = "user"
    sg_description = "creating sg for user"
    vpc_id = local.vpc_id
    
}

module "cart" {
    source = "../../aws-security-group-tf"
    project = "roboshop"
    environment = "dev"
    sg_name = "cart"
    sg_description = "creating sg for cart"
    vpc_id = local.vpc_id
    
}

module "shipping" {
    source = "../../aws-security-group-tf"
    project = "roboshop"
    environment = "dev"
    sg_name = "shipping"
    sg_description = "creating sg for shipping"
    vpc_id = local.vpc_id
    
}

module "payment" {
    source = "../../aws-security-group-tf"
    project = "roboshop"
    environment = "dev"
    sg_name = "payment"
    sg_description = "creating sg for payment"
    vpc_id = local.vpc_id
    
}


resource "aws_security_group_rule" "laptop_bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = module.bastion.sg_id
}
resource "aws_security_group_rule" "bastion_frontend" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id = module.bastion.sg_id
  security_group_id = module.frontend.sg_id
}

resource "aws_security_group_rule" "bastion_catalogue" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id = module.bastion.sg_id
  security_group_id = module.catalogue.sg_id
}
resource "aws_security_group_rule" "bastion_user" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id = module.bastion.sg_id
  security_group_id = module.user.sg_id
}
resource "aws_security_group_rule" "bastion_cart" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id = module.bastion.sg_id
  security_group_id = module.cart.sg_id
}
resource "aws_security_group_rule" "bastion_shipping" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id = module.bastion.sg_id
  security_group_id = module.shipping.sg_id
}
resource "aws_security_group_rule" "bastion_payment" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id = module.bastion.sg_id
  security_group_id = module.payment.sg_id
}
resource "aws_security_group_rule" "bastion_mongodb" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id = module.bastion.sg_id
  security_group_id = module.mongodb.sg_id
}
resource "aws_security_group_rule" "bastion_redis" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id = module.bastion.sg_id
  security_group_id = module.redis.sg_id

}
resource "aws_security_group_rule" "bastion_mysql" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id = module.bastion.sg_id
  security_group_id = module.mysql.sg_id
}
resource "aws_security_group_rule" "bastion_rabbitmq" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id = module.bastion.sg_id
  security_group_id = module.rabbitmq.sg_id
}

resource "aws_security_group_rule" "frontend_alb_http" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = module.frontend_alb.sg_id
}

resource "aws_security_group_rule" "frontend_alb_https" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = module.frontend_alb.sg_id
}
resource "aws_security_group_rule" "frontend_alb_frontend" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  source_security_group_id = module.frontend_alb.sg_id
  security_group_id = module.frontend.sg_id
}


resource "aws_security_group_rule" "frontend_backend_alb" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  source_security_group_id = module.frontend.sg_id
  security_group_id = module.backend_alb.sg_id
}



resource "aws_security_group_rule" "backend_alb_catalogue" {
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  source_security_group_id = module.backend_alb.sg_id
  security_group_id = module.catalogue.sg_id
}
resource "aws_security_group_rule" "backend_alb_user" {
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  source_security_group_id = module.backend_alb.sg_id
  security_group_id = module.user.sg_id
}
resource "aws_security_group_rule" "backend_alb_cart" {
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  source_security_group_id = module.backend_alb.sg_id
  security_group_id = module.cart.sg_id
}
resource "aws_security_group_rule" "backend_alb_shipping" {
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  source_security_group_id = module.backend_alb.sg_id
  security_group_id = module.shipping.sg_id
}
resource "aws_security_group_rule" "backend_alb_payment" {
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  source_security_group_id = module.backend_alb.sg_id
  security_group_id = module.payment.sg_id
}


resource "aws_security_group_rule" "catalogue_mongodb" {
  type              = "ingress"
  from_port         = 27017
  to_port           = 27017
  protocol          = "tcp"
  source_security_group_id = module.catalogue.sg_id
  security_group_id = module.mongodb.sg_id
}



resource "aws_security_group_rule" "user_mongodb" {
  type              = "ingress"
  from_port         = 27017
  to_port           = 27017
  protocol          = "tcp"
  source_security_group_id = module.user.sg_id
  security_group_id = module.mongodb.sg_id
}
resource "aws_security_group_rule" "user_redis" {
  type              = "ingress"
  from_port         = 6379
  to_port           = 6379
  protocol          = "tcp"
  source_security_group_id = module.user.sg_id
  security_group_id = module.redis.sg_id
}


resource "aws_security_group_rule" "cart_redis" {
  type              = "ingress"
  from_port         = 6379
  to_port           = 6379
  protocol          = "tcp"
  source_security_group_id = module.cart.sg_id
  security_group_id = module.redis.sg_id
}



resource "aws_security_group_rule" "shipping_mysql" {
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  source_security_group_id = module.shipping.sg_id
  security_group_id = module.mysql.sg_id
}



resource "aws_security_group_rule" "payment_rabbitmq" {
  type              = "ingress"
  from_port         = 5672
  to_port           = 5672
  protocol          = "tcp"
  source_security_group_id = module.payment.sg_id
  security_group_id = module.rabbitmq.sg_id
}

resource "aws_security_group_rule" "payment_backend_alb" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  source_security_group_id = module.payment.sg_id
  security_group_id = module.backend_alb.sg_id
}

resource "aws_security_group_rule" "shipping_backend_alb" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  source_security_group_id = module.shipping.sg_id
  security_group_id = module.backend_alb.sg_id
}
resource "aws_security_group_rule" "cart_backend_alb" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  source_security_group_id = module.cart.sg_id
  security_group_id = module.backend_alb.sg_id
}

resource "aws_security_group_rule" "user_backend_alb" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  source_security_group_id = module.user.sg_id
  security_group_id = module.backend_alb.sg_id
}