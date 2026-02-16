resource "aws_instance" "mongodb" {
  ami           = local.ami_id
  instance_type = "t3.micro"
  vpc_security_group_ids = [local.mongodb_sg_id]
  subnet_id = local.database_subnet_ids[0]

  tags = merge(
    local.common_tags,
    {
        Name = "${var.project}-${var.environment}-mongodb"
    }
  )
}

resource "terraform_data" "bootstrap" {
  triggers_replace = [
    aws_instance.mongodb.id
  ]

  provisioner "file" {
    source = "bootstrap.sh"
    destination = "/tmp/bootstrap.sh"
  }

    connection {
    type     = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
    host     = aws_instance.mongodb.private_ip
  }

  provisioner "remote-exec" {
    inline = [
     "chmod +x /tmp/bootstrap.sh",
     "sudo sh /tmp/bootstrap.sh mongodb ${var.environment}"
    ]
  }
}

resource "aws_route53_record" "mongodb" {
  zone_id = local.zone_id
  name    = "mongodb-${var.environment}.${var.zone_name}"
  type    = "A"
  ttl     = 120
  records = [aws_instance.mongodb.private_ip]
  allow_overwrite = true
}

# resource "aws_instance" "redis" {
#   ami           = local.ami_id
#   instance_type = "t3.micro"
#   vpc_security_group_ids = [local.redis_sg_id]
#   subnet_id = local.database_subnet_ids[0]

#   tags =   tags = merge(
#     local.common_tags,
#     {
#         Name = "${var.project}-${var.environment}-redis"
#     }
#   )
# }

# resource "terraform_data" "bootstrap" {
#   triggers_replace = [
#     aws_instance.redis.id
#   ]

#   provisioner "file" {
#     source = "bootstrap.sh"
#     destination = "/tmp/bootstrap.sh"
#   }

#     connection {
#     type     = "ssh"
#     user     = "ec2-user"
#     password = "DevOps321"
#     host     = aws_instance.redis.private_ip
#   }

#   provisioner "remote-exec" {
#     inline = [
#      "chmod +x /tmp/bootstrap.sh"
#      "sudo sh /tmp/bootstrap.sh redis ${var.environment}"
#     ]
#   }
# }

# resource "aws_route53_record" "redis" {
#   zone_id = local.zone_id
#   name    = "redis-${var.environment}.${var.zone_name}"
#   type    = "A"
#   ttl     = 120
#   records = [aws_instance.redis.private.ip]
#   allow_overwrite = true
# }

# resource "aws_instance" "mysql" {
#   ami           = local.ami_id
#   instance_type = "t3.micro"
#   vpc_security_group_ids = [local.mysql_sg_id]
#   subnet_id = local.database_subnet_ids[0]

#   tags =  tags = merge(
#     local.common_tags,
#     {
#         Name = "${var.project}-${var.environment}-mysql"
#     }
#   )
# }

# resource "terraform_data" "bootstrap" {
#   triggers_replace = [
#     aws_instance.mysql.id
#   ]

#   provisioner "file" {
#     source = "bootstrap.sh"
#     destination = "/tmp/bootstrap.sh"
#   }

#     connection {
#     type     = "ssh"
#     user     = "ec2-user"
#     password = "DevOps321"
#     host     = aws_instance.mysql.private_ip
#   }

#   provisioner "remote-exec" {
#     inline = [
#      "chmod +x /tmp/bootstrap.sh"
#      "sudo sh /tmp/bootstrap.sh mysql ${var.environment}"
#     ]
#   }
# }

# resource "aws_route53_record" "mysql" {
#   zone_id = local.zone_id
#   name    = "mysql-${var.environment}.${var.zone_name}"
#   type    = "A"
#   ttl     = 120
#   records = [aws_instance.mysql.private.ip]
#   allow_overwrite = true
# }

# resource "aws_instance" "rabbitmq" {
#   ami           = local.ami_id
#   instance_type = "t3.micro"
#   vpc_security_group_ids = [local.rabbitmq_sg_id]
#   subnet_id = local.database_subnet_ids[0]

#   tags =   tags = merge(
#     local.common_tags,
#     {
#         Name = "${var.project}-${var.environment}-rabbitmq"
#     }
#   )
# }

# resource "terraform_data" "bootstrap" {
#   triggers_replace = [
#     aws_instance.rabbitmq.id
#   ]

#   provisioner "file" {
#     source = "bootstrap.sh"
#     destination = "/tmp/bootstrap.sh"
#   }

#     connection {
#     type     = "ssh"
#     user     = "ec2-user"
#     password = "DevOps321"
#     host     = aws_instance.rabbitmq.private_ip
#   }

#   provisioner "remote-exec" {
#     inline = [
#      "chmod +x /tmp/bootstrap.sh"
#      "sudo sh /tmp/bootstrap.sh rabbitmq ${var.environment}"
#     ]
#   }
# }

# resource "aws_route53_record" "rabbitmq" {
#   zone_id = local.zone_id
#   name    = "rabbitmq-${var.environment}.${var.zone_name}"
#   type    = "A"
#   ttl     = 120
#   records = [aws_instance.rabbitmq.private.ip]
#   allow_overwrite = true
# }

