locals {
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    backend_alb_listener_arn=data.aws_ssm_parameter.backend_alb_listener_arn.value
}