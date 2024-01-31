resource "aws_vpc" "vpc1" {
  cidr_block = "11.0.0.0/24"
  tags = {
    Name = "myvpc1"
  }
}

