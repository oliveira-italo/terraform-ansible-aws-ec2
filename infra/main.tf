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
  # profile = "default"
  region = var.aws_region
}

resource "aws_key_pair" "chaveSSH" {
  key_name   = var.ssh_key
  public_key = file("${var.ssh_key}.pub")
}

resource "aws_instance" "app_server" {
  ami           = "ami-0eb199b995e2bc4e3" // código do sistema operacional que rodará na instancia, disponível no AMI catalog na AWS
  instance_type = var.instance_type       // tipo de instancia aws, com configurações próprias de hardware
  key_name      = var.ssh_key             // chave ssh, criada no console aws (EC2 -> KEY PAIRS), será usada para acessar a instancia (ver connect ssh no console do EC2)
  # user_data     = <<-EOF
  #                 #!/bin/bash
  #                 cd /home/ubuntu
  #                 echo "<h1>The book is on the table</h1>" > index.html
  #                 nohup busybox httpd -f -p 8080 &
  #               EOF
  tags = {
    Name = "terraform-ansible-${var.env_name}"
  }
}

output "public_ip" {
  value = aws_instance.app_server.public_ip
}
