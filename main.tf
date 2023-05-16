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
  cidr_block = "100.0.1.0/24"

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