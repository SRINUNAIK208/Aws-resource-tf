locals {
    acm_certificate_arn= data.aws_ssm_parameter.aws_acm_certificate.value 
    public_subnet_ids = split(",",data.aws_ssm_parameter.public_subnet_ids.value)
    frontend_alb_sg_id = data.aws_ssm_parameter.frontend_alb_sg_id.value
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    common_tags = {
        project = var.project
        environment= var.environment
        terraform = true
    }
   
}