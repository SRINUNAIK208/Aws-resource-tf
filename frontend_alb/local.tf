locals {
    acm_certificate_arn= data.aws_ssm_parameter.aws_acm_certificate.value 
}