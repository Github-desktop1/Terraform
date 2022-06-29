resource "aws_vpc" "terraform-vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    name = "terraform vpc"
  }
}

resource "aws_subnet" "pub_subnet" {
  vpc_id     = aws_vpc.terraform-vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    name = "pub subnet"
  }
}
resource "aws_subnet" "pvt_subnet" {
  vpc_id     = aws_vpc.terraform-vpc.id
  cidr_block = "10.0.2.0/24"

  tags = {
    name = "pvt subnet"
   }
}
resource "aws_route_table" "pub_route" {
    vpc_id = aws_vpc.terraform-vpc.id

    tags = {
     name = "pub route" 
     }
}

resource "aws_route_table_association" "attachment" {
  subnet_id      = aws_subnet.pub_subnet.id
  route_table_id = aws_route_table.pub_route.id
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.terraform-vpc.id

  tags = {
    name = "igw_pub"
  }
}



