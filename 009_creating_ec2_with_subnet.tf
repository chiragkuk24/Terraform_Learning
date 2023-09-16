resource "aws_instance" "myec2"{
	ami           = "ami-0f409bae3775dc8e5" 
	instance_type = "t2.micro"
	key_name = "NVirgina-ForLinux"
	subnet_id	=	aws_subnet.tfsubnet.id
	tags	=	{
		Name	=	"app1-from-Terraform"
	}
	vpc_security_group_ids	=	[aws_security_group.tfsecgroup.id]
	
}