###Creating the Random number for the end of bucket
resource "random_id" "myrandom_id"{
    byte_length = 2
}
#This line of code prints the the random value generated above
output "randomid"{
    value = random_id.myrandom_id.dec
}
resource "aws_s3_bucket" "example" {
 
 /*This line of code basically takes the file name from 
 variable file and the random_id will append 
 for example bucket name is Chiragkukbucket and random id 
 generated is 234881 so the final bucket will be 
 "Chiragkukbucket-234881" */ 
 
  bucket = "${var.bucket_name}-${random_id.myrandom_id.dec}"

  tags = {
    Name        = var.bucket_name
  }
}