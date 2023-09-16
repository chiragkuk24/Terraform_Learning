vpc_cidr="10.200.0.0/16"
vpc_name="app1-vpc"
igw_name="app1-vpc-igw"
route_name="app1-vpc-route1"
sub_cidr="10.200.1.0/24"
sub_name="app1-vpc-sub1"
sec_group_name="app1-vpc-secgroup1"
ingress_rules=[
	{
	from_port	=	22
	to_port		=	22
	protocol	=	"tcp"
	cidr_block	=	"0.0.0.0/0"
	description	=	"allow ssh"
	},
	{	
	from_port	=	80
	to_port		=	80
	protocol	=	"tcp"
	cidr_block	=	"0.0.0.0/0"
	description	=	"allow http"
	}
]