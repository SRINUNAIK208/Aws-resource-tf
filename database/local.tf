locals {
    amin_id = data.aws_ami.joindevops.id
    mongodb_sg_id = data.aws_ssm_parameter.mongodb_sg_id.values
    redis_sg_id = data.aws_ssm_parameter.redis_sg_id.values
    mysql_sg_id = data.aws_ssm_parameter.mysql_sg_id.values
    rabbitmq_sg_id = data.aws_ssm_parameter.rabbitmq_sg_id.values
    database_subnet_ids = split(",",data.aws_ssm_parameter.database_subnet_ids.values)
    common_tags = {
        project = var.project
        environment = var.environment
        terraform = true
    }
}