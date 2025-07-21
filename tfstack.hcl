
stack "exemplo-stack" {
  description = "Stack exemplo usando módulos públicos Terraform AWS."

  variables = {
    aws_region  = "us-east-1"
    environment = "dev"
  }

  backend "s3" {
    bucket = "meu-bucket-state-terraform"
    key    = "states/${stack.name}/terraform.tfstate"
    region = "us-east-1"
  }

  provider "aws" {
    alias  = "default"
    region = var.aws_region
  }

  layer "network" {
    source = "./layers/network"
  }

  layer "application" {
    source     = "./layers/application"
    depends_on = ["network"]
  }
}
