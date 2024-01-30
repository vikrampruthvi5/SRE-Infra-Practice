# Tools VPC
resource "aws_vpc" "tools_vpc" {
  cidr_block = var.tools_vpc_cidr
  tags = {
    "Name": "tools_vpc"
  }
}

# Tools Subnet
resource "aws_subnet" "tools_subnet" {
  cidr_block = var.tools_vpc_cidr
  vpc_id = aws_vpc.tools_vpc.id
  tags = {
    "Name": "tools_subnet"
  }
}

# Tools IGW
resource "aws_internet_gateway" "tools_igw" {
  vpc_id = aws_vpc.tools_vpc.id
  tags = {
    "Name": "tools_igw"
  }
}

# Tools Route Table
resource "aws_route_table" "tools_route_table" {
  vpc_id = aws_vpc.tools_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.tools_igw.id
  }
  tags = {
    "Name": "tools_route_table"
  }
}

resource "aws_main_route_table_association" "tools_rt_main_assoc" {
  vpc_id = aws_vpc.tools_vpc.id
  route_table_id = aws_route_table.tools_route_table.id
}
output "aws_rt" {
  value = aws_route_table.tools_route_table.id
}

# Tools rt and subnet assoc
resource "aws_route_table_association" "tools_rt_sn_assoc" {
  route_table_id = aws_route_table.tools_route_table.id
  subnet_id = aws_subnet.tools_subnet.id
}

# Tools rt and igw assoc
# resource "aws_route_table_association" "tools_rt_igw_assoc" {
#   route_table_id = aws_route_table.tools_route_table.id
#   gateway_id = aws_internet_gateway.tools_igw.id
# }



