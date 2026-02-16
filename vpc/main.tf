module "vpc" {
    source = "../../Aws-vpc-tf"
    project = "roboshop"
    environment = "dev"
    public_subnet_cidrs = ["10.0.1.0/24", "10.0.11.0/24"]
    private_subnet_cidrs = ["10.0.21.0/24", "10.0.31.0/24"]
    database_subnet_cidrs = ["10.0.41.0/24", "10.0.51.0/24"]
}