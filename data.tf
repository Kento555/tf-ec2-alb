# data "aws_vpc" "selected" {
#   filter {
#     name   = "tag:Name"
#     values = ["*shared-vpc"]
#   }
# }

data "aws_vpc" "selected" {
  id = var.vpc_id
}
variable "vpc_id" {
  default = "vpc-0a8963a83c4771c93"
}


data "aws_subnets" "public" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.selected.id]
  }
  filter {
    name   = "tag:Name"
    values = ["*public*"]
  }
}

data "aws_subnets" "private" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.selected.id]
  }
  filter {
    name   = "tag:Name"
    values = ["*private*"]
  }
}

