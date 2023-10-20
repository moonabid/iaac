resource "aws_instance" "aws_mfh_ec2" {

  ami                         = "ami-09a81b370b76de6a2"
  instance_type               = "t2.micro"
  vpc_security_group_ids      = [aws_security_group.aws_sg.id]
  associate_public_ip_address = true
  key_name                    = "mfh-key" # your key here

  tags = {
    Name = "mfh-ec2-dev"
  }

}
