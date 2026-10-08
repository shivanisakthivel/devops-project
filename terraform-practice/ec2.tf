resource "aws_instance" "projectec2" {
  ami           = "ami-0b6d9d3d33ba97d99"
  instance_type = "t3.micro"
  key_name = "ec2key"
  

  tags = {
    Name = "projectec2"
  }
}
resource "aws_instance" "project1ec2" {
  ami           = "ami-0b6d9d3d33ba97d99"
  instance_type = "t3.micro"
  key_name = "ec2key"
  

  tags = {
    Name = "project1ec2"
  }
}
