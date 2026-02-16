locals {
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    frontend_alb_listener_arn=data.aws_ssm_parameter.frontend_alb_listener_arn.value
    frontend_sg_id = data.aws_ssm_parameter.frontend_sg_id.value
    private_subnet_ids = split(",",data.aws_ssm_parameter.private_subnet_ids.value)
    ami_id = data.aws_ami.joindevops.id
     common_tags = {
        project = var.project
        environment= var.environment
        terraform = true
    }
}