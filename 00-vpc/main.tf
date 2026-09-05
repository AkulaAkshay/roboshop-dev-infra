module "vpc" {
    #source = "../terraform-aws-vpc"
    source = "git::https://github.com/AkulaAkshay/terraform-aws-vpc.git"

    vpc_cidr = var.vpc_cidr
    project_name = var.project_name
    environment = var.environment
    vpc_tags = var.vpc_tags

    #public subnet cidr
    public_subnet_cidr = var.public_subnet_cidr

    #private subnet cidr
    private_subnet_cidr = var.private_subnet_cidr

    #database subnet cidr
    database_subnet_cidr = var.database_subnet_cidr

    is_peering_required = true

}



