variable "project_name" {
    type = string
    default = "roboshop"
}

variable "environment" {
    type = string
    default = "dev"
}

variable "zone_id" { #Hosted zone ID
    default = "Z02237942WL8S6DN4RI1T"
}

variable "domain_name" { #Hosted zone name
    default = "akshaysunny.space"
} # if necessary, since we provide the details of hosted zone, we can query the zone id .