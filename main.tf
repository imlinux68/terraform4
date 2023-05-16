provider "aws" {
  region = "us-west-2"
}

resource "aws_vpc" "main_vpc" {
    cidr_block = var.myvpcvar

    tags = {
        "Name" = "main_vpc"
    }
}

resource "aws_subnet" "mainSN" {
  vpc_id = aws_vpc.main_vpc.id
  cidr_block = var.subnet_cidr

  tags = {
    "Name" = "MyMain_SN"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    "Name" = "MyGW"
  }
}

resource "aws_route_table" "MyMainRT" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    "Name" = "MyDefault gateway"
  }
}

resource "aws_route" "def_route" {
    route_table_id = aws_route_table.MyMainRT.id
    destination_cidr_block = var.route_dest_block
    gateway_id = aws_internet_gateway.gw.id
}


resource "aws_route_table_association" "public_ip_assoc" {
  subnet_id = aws_subnet.mainSN.id
  route_table_id = aws_route_table.MyMainRT.id
}

resource "aws_security_group" "MySg" {
  name = "dev_sg"
  vpc_id = aws_vpc.main_vpc.id
  description = "My security group"

  ingress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Name" = "My security group"
  }
}

resource "aws_key_pair" "Mykey" {
    key_name = "My-Key"
    public_key = file("~/.ssh/ec2-instances.pub")
  
}

resource "aws_instance" "name" {
  
}