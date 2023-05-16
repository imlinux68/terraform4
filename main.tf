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
  
}