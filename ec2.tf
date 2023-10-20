resource "aws_instance" "web" {
  ami           = "ami-09a81b370b76de6a2"
  instance_type = "t2.micro"
  key_name      = "afreen"
  vpc_security_group_ids  = [aws_security_group.apple.id]

  tags = {
    Name = "HelloWorld"
  }
}

resource "aws_key_pair" "moon" {
  key_name   = "afreen"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCms+0pf8D2EEtdnVA3v+zc/P7ztVP/DrmdKOB1ZRfy2NYQ7faxKTuvVrNdzKvEdyxmnwK3+/+PrYLpygl3AzASnSKUqe3dO8ey6P49aT6gbPNLyDfppURKj9MrVLBGXhIzPJG01NCvZJFWMEkASYkY2u2L6hvbuP2mqgJACBBJufN0UWCH1PkYh+IHLxCDe2uj5AHdf6/nVuLiNgbRKmQEIfDg57Jgx3U5hjBjtUd5JKCSVgz/quVDnmUOVHG1Iel9RhtWxInlVKnP0bJ7P7ZtzpkNWGgITZEJDIJWijOF0DEDV4WAHg1RR0lS2XAzZdjJFNHAPojcnqPxET4N9WH7 root@ip-172-31-44-43.ap-south-1.compute.internal"

}

resource "aws_eip" "elastic" {
  instance = aws_instance.web.id
  vpc      = true
}


resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

resource "aws_security_group" "apple" {
  name        = "apple"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_default_vpc.default.id

 
ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]

  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]

  }

  tags = {
    Name = "allow_tls"
  }
}

