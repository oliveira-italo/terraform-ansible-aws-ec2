terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  profile = "default"
  region = "us-west-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0eb199b995e2bc4e3" // código do sistema operacional que rodará na instancia, disponível no AMI catalog na AWS
  instance_type = "t2.micro" // tipo de instancia aws, com configurações próprias de hardware
  key_name = "iac-alura" // chave ssh, criada no console aws (EC2 -> KEY PAIRS), será usada para acessar a instancia (ver connect ssh no console do EC2)
  tags = {
    Name = "Primeira instância"
  }
}
