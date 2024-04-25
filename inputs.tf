variable "ntierVpccidr" {
  type    = string
  default = "10.0.0.0/16" # this is the vpc cidr range 
}

variable "regionName" {
  type    = string
  default = "us-east-1" # this is the default region
}

variable "subnets" {
  type    = list(string)
  default = ["web1", "web2", "app1", "app2", "db1", "db2"]
}

variable "azs" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1b", "us-east-1c", "us-east-1d", "us-east-1e", "us-east-1f", ]
}







