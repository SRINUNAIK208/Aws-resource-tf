data "aws_ssm_parameter" "aws_acm_certificate" {
  name = name  = "/${var.project}/${var.environment}/aws_acm_certificate"
}