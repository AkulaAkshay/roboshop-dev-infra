module "vpc" {
    #source = "../terraform-aws-vpc"
    source = "git::https://github.com/AkulaAkshay/terraform-aws-vpc.git"

    vpc_cidr = var.vpc_cidr
    project_name = var.project_name
    environment = var.environment
    vpc_tags = var.vpc_tags

    #public subnet cidr
    public_subnet_cidrs = var.public_subnet_cidrs

    #private subnet cidr
    private_subnet_cidrs = var.private_subnet_cidrs

    #database subnet cidr
    database_subnet_cidrs = var.database_subnet_cidrs

    is_peering_required = true

}



