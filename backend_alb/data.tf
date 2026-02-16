data "aws_ssm_parameter" "vpc_id" {
  name = name  = "/${var.project}/${var.environment}/vpc_id"
}

data "aws_ssm_parameter" "private_subnet_ids" {
  name = name  = "/${var.project}/${var.environment}/private_subnet_ids"
}

data "aws_ssm_parameter" "backend_alb_sg_id" {
  name = name  = "/${var.project}/${var.environment}/backend_alb_sg_id"
}