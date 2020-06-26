# A change for Git experimental branch
#Root user main.tf file

provider "aws" {
   version = "~> 2.41"
   region = "us-west-1"

   }
resource "aws_key_pair" "akp" {
   key_name = "june_11_20"
   public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQChE+ni7g0dmdr1P60GWTYqQ3I8tVgjMuaFl0beJMELXNVPqzIv9upvJ/pE8gs0zU0bvQhC73r+r0E94hf3z++bnduDveESGv14AI6jRDeMgvRO0JLg/QQMRWzoOJFpSqFeTbaxPYMO8xdXo/7dLFU+PxXrbt6apI5IapVONNVAQhXH6LvG6xHSPaH+/Aee0MPzboM7WC441GB0nsB5iPiA6SarWerJGbu5a9aKulnAuj70nvqCo8WVDpygco1st5ItS3H4VBgQiQdybsDBK/R5tUq7ZjYwHzTBA/GI8BFtgA/srC0VKxD8TXC9d2Im2Rnn6TRXaKA5KWI3OnLbYrLb"
   }
resource "aws_instance" "exampleroot" {
   ami           = "ami-0dbf5ea29a7fc7e05"
   instance_type = "t2.micro"
   key_name = "${aws_key_pair.akp.key_name}"
   user_data = <<EOF
   #!/bin/bash
   echo "Hello world" > index.html
   nohup busybox httpd -f -p 8080 &
   EOF
   tags = {
   Name = "terraform_root_example"
   }
   
}

		
	 