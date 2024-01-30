resource "aws_vpc" "tools_vpc" {
  cidr_block = var.tools_vpc_cidr
  tags = {
    "Name": "tools_vpc"
  }
}
