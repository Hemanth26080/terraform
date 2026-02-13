variable "instance" {
    default = ["mongodb", "redis", "mysql", "rabbitmq", "catalogue", "user", "cart", "shipping", "payment", "frontend"]
}

variable "zone_id" {
    type = string
    default = "Z09571432H0XSZWLPQGY5"
    description = "Route53 Zone ID"
}

variable "domain_name" {
    default = "phemanth.in"
    description = "Domain Name"
}