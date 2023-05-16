provider "aws" {
  region = "us-west-2"
}

resource "aws_vpc" "main_vpc" {
    cidr_block = var.myvpcvar

    tags = {
        "Name" = "main_vpc"
    }
}