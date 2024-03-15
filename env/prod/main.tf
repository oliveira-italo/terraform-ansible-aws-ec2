module "aws-prod" {
  source = "../../infra"
  instance_type = "t2.micro"
  aws_region = "us-west-2"
  ssh_key = "iac-prod"
  env_name = "prod"
}

output "ip" {
  value = module.aws-prod.public_ip
}