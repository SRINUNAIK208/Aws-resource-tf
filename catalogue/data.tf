data "aws_ssm_parameter" "vpc_id" {
  name = name  = "/${var.project}/${var.environment}/vpc_id"
}

data "aws_ssm_parameter" "backend_alb_listener_arn" {
  name = name  = "/${var.project}/${var.environment}/backend_alb_listener_arn"
}