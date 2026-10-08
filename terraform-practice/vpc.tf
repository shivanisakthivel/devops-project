#vpc
resource "aws_vpc" "project-vpc" {
  cidr_block       = "11.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "project-vpc"
  }
}
#publicsubnet1
resource "aws_subnet" "public-subnet-1" {
  vpc_id     = aws_vpc.project-vpc.id
  cidr_block = "11.0.1.0/24"

  tags = {
    Name = "public-subnet-1"
  }
}
#publicsubnet2
resource "aws_subnet" "public-subnet-2" {
  vpc_id     = aws_vpc.project-vpc.id
  cidr_block = "11.0.2.0/24"

  tags = {
    Name = "public-subnet-2"
  }
}
#internet gateway
resource "aws_internet_gateway" "project-igw" {
  vpc_id = aws_vpc.project-vpc.id

  tags = {
    Name = "project-igw"
  }
}
#route table
resource "aws_route_table" "project-route-table" {
  vpc_id = aws_vpc.project-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.project-igw.id
  }
  tags = {
    Name = "project-route-table"
  }
}
#route table association
resource "aws_route_table_association" "project-rt-assoc" {
  subnet_id      = aws_subnet.public-subnet-1.id
  route_table_id = aws_route_table.project-route-table.id
}
resource "aws_route_table_association" "project-rt-associ" {
  subnet_id      = aws_subnet.public-subnet-2.id
  route_table_id = aws_route_table.project-route-table.id
}
