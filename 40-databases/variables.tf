variable "project_name" {
    default = "roboshop"
}

variable "environment" {
    default = "dev"
}

variable "sg_names" {
    default = [
        # databases
        "mongodb", "redis", "mysql", "rabbitmq",
        # backend
        "catalogue", "user", "cart", "shipping", "payment",
        # frontend
        "frontend",
        # bastion
        "bastion",
        # frontend load balancer
        "frontend_alb",
        # Backend ALB
        "backend_alb"
    ]
}

variable "zone_id" { #Hosted zone ID
    default = "Z02237942WL8S6DN4RI1T"
}

variable "domain_name" { #Hosted zone name
    default = "akshaysunny.space"
} # if necessary, since we provide the details of hosted zone, we can query the zone id .