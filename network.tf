resource "aws_vpc" "ntierVpc" {
  cidr_block       = var.ntierVpccidr
  instance_tenancy = "default"
  tags = {
    "name" = "ntiervpc"
    "env"  = "test"
  }
}

resource "aws_subnet" "web1" {
  count      = length(var.subnets) # it will create the subnets based on the length of the varable
  vpc_id     = aws_vpc.ntierVpc.id
  cidr_block = cidrsubnet(aws_vpc.ntierVpc.cidr_block, 8, count.index)
  tags = {
    "name" = var.subnets[count.index]
    "env"  = "test"
  }
  depends_on        = [aws_vpc.ntierVpc]
  availability_zone = var.azs[count.index]
}

resource "aws_internet_gateway" "myInternetgateway" {
  vpc_id = local.vpc.id
  tags = {
    "name" = "myigw"
    "env"  = "test"
  }

}


resource "aws_route_table" "myroute" {
  vpc_id = local.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = local.igw.id

  }
  tags = {
    "name" = "myRTtable"
    "env"  = "test"
  }

}


