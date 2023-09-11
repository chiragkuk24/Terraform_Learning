resource "aws_instance" "myec2-instance" {
  for_each      =  var.server_details
  ami           = "ami-0f409bae3775dc8e5" 
  instance_type = "t2.micro"
  key_name = each.value.keypair

  tags = {
    Name = each.value.name
  }
}