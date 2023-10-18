resource "aws_instance" "aws_mfh_ec2" {

  ami                         = "ami-0da59f1af71ea4ad2"
  instance_type               = "t2.micro"
  vpc_security_group_ids      = [aws_security_group.aws_sg.id]
  associate_public_ip_address = true
  key_name                    = "mfh-key" # your key here

  tags = {
    Name = "mfh-ec2-dev"
  }

}
