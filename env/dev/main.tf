module "aws-dev" {
  source = "../../infra"
  instance_type = "t2.micro"
  aws_region = "us-west-2"
  ssh_key = "iac-dev"
  env_name = "dev"
}

output "ip" {
  value = module.aws-dev.public_ip
}