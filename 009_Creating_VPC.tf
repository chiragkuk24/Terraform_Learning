#This Block creates the VPC in AWS
resource "aws_vpc" "tfvpc" {
	cidr_block	= var.vpc_cidr
	tags	=	{
		Name = var.vpc_name
	}
}
#This Block creates the IGW in AWS
resource "aws_internet_gateway" "tfigw" {
	vpc_id = aws_vpc.tfvpc.id
	tags	=	{
		Name	=	var.igw_name
	}
}
#This Block creates the Route Table in AWS
resource "aws_route_table" "tfroute" {
	vpc_id	=	aws_vpc.tfvpc.id
	
	route{
		cidr_block	=	"0.0.0.0/0"
		gateway_id	=	aws_internet_gateway.tfigw.id
	}
	tags	=	{
		Name	=	var.route_name
	}
}
#This Block creates the Subnet in AWS
resource "aws_subnet" "tfsubnet" {
	vpc_id	=	aws_vpc.tfvpc.id
	cidr_block	=	var.sub_cidr
	tags	=	{
		Name	=	var.sub_name
	}
}
#This Block creates the Route Table Association in AWS
resource "aws_route_table_association" "tfassociation" {
	subnet_id	=	aws_subnet.tfsubnet.id
	route_table_id	=	aws_route_table.tfroute.id
}
#This Block creates the Security Group in AWS
resource "aws_security_group" "tfsecgroup" {
	name	=	var.sec_group_name
	vpc_id	=	aws_vpc.tfvpc.id
    #This Block creates the Static Valuesof Inbound and Outbound Rules in AWS
	/*
	ingress{
	description = "Allow all ingress"
	from_port	=	0
	to_port		=	0
	protocol	=	"-1"
	cidr_blocks	=	["0.0.0.0/0"]
	}
	
	egress {
	from_port	=	0
	to_port		=	0
	protocol	=	"-1"
	cidr_blocks	=	["0.0.0.0/0"]
	}
	*/
}
##This Block creates the Inbound Rules in AWS
resource "aws_security_group_rule" "ingress_rules" {
count	=	length(var.ingress_rules)
type	=	"ingress"
from_port = var.ingress_rules[count.index].from_port
to_port	=	var.ingress_rules[count.index].to_port
protocol	=	var.ingress_rules[count.index].protocol
cidr_blocks	=	[var.ingress_rules[count.index].cidr_block]
description	=	var.ingress_rules[count.index].description
security_group_id	=	aws_security_group.tfsecgroup.id
}