variable "vpc_cidr" {}
variable "vpc_name" {}
variable "igw_name" {}
variable "route_name" {}
variable "sub_cidr" {}
variable "sub_name" {}
variable "sec_group_name" {}
variable "ingress_rules"{
	type	=	any
}