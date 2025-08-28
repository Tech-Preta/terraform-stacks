
variable "vpc_id" {
  description = "ID da VPC da layer network"
  type        = string
}
variable "public_subnets" {
  description = "Subnets públicas da VPC"
  type        = list(string)
}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.2.0"

  name          = "exemplo-app"
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t3.micro"
  subnet_id     = var.public_subnets[0]
}
