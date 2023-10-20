resource "aws_instance" "web"{
  ami           = "ami-09a81b370b76de6a2"
  instance_type = "t2.micro"

  tags = {
    Name = "ec2"
  }
  user_data = file("ubuntu.sh")
}
