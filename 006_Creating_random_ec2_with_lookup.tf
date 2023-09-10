resource "aws_instance" "myec2-instance" {
 count = 2
  ami           = "ami-0f409bae3775dc8e5" 
  instance_type = "t2.micro"
  key_name = "NVirgina-ForLinux"

  tags = {
    Name = element(var.server_names,count.index)
  }
}
