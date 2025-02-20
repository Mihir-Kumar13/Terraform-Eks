variable "region" {
  description = "value of region"
  type        = string
}

variable "vpc_cidr" {
  description = "value of vpc cidr"
  type        = string
}

variable "azs" {
  description = "value of availability zones"
  type        = list(string)
}

variable "private_subnets" {
  description = "value of private subnets"
  type        = list(string)
}

variable "public_subnets" {
  description = "value of public subnets"
  type        = list(string)
}

variable "node_groups_defaults" {
  type    = map(any)
  default = {}
}



