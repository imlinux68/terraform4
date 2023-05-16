variable "myvpcvar" { 
    type = string
    default = "100.0.0.0/16"
}

variable "subnet_cidr" {
    type = string
    default = "100.0.1.0/24"
}

variable "route_dest_block" {
    type = string
    default = "0.0.0.0/0"
}

