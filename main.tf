provider "aws" {
  region = "ap-northeast-1"
}

locals {
  app_name = "web"
}

variable "env" {
  type = string
  default = "dev"
}

resource "aws_vpc" "web_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "${var.env}-${local.app_name}-vpc"
  }
}

resource "aws_subnet" "web_subnet" {
  vpc_id = aws_vpc.web_vpc.id
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = "${var.env}-${local.app_name}-subnet"
  }
}
