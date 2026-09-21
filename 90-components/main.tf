module "components" {
    source = "git::https://github.com/AkulaAkshay/terraform-roboshop-component.git?ref=main"
    component = var.component
    rule_priority = var.rule_priority
}