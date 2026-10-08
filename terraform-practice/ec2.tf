resource "aws_instance" "projectec2" {
  ami                         = "ami-0b6d9d3d33ba97d99"
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.public-subnet-1.id
  key_name                    = "ec2key"
  vpc_security_group_ids      = [aws_security_group.project-sg.id]
  associate_public_ip_address = "true"


  tags = {
    Name = "ec2-1"
  }
}
resource "aws_instance" "project1ec2" {
  ami                         = "ami-0b6d9d3d33ba97d99"
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.public-subnet-2.id
  key_name                    = "ec2key"
  vpc_security_group_ids      = [aws_security_group.project-sg.id]
  associate_public_ip_address = "true"



  tags = {
    Name = "ec2-2"
  }
}
resource "aws_security_group" "project-sg" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.project-vpc.id

  tags = {
    Name = "project-security-group"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.project-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  security_group_id = aws_security_group.project-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}
resource "aws_vpc_security_group_egress_rule" "allow_all_outbound" {
  security_group_id = aws_security_group.project-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}
