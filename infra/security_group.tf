resource "aws_security_group" "default_access" {
  name        = "default_access_${var.env_name}"
  description = "security rules"
  ingress {
    cidr_blocks      = ["0.0.0.0/0"] #/0 para qualquer IP, /32 para um único IP
    ipv6_cidr_blocks = ["::/0"]
    from_port        = 0 #0 => todas as portas disponíveis
    to_port          = 0
    protocol         = "-1" #-1 => todos os protocolos
  }
  egress {
    cidr_blocks      = ["0.0.0.0/0"] #/0 para qualquer IP, /32 para um único IP
    ipv6_cidr_blocks = ["::/0"]
    from_port        = 0 #0 => todas as portas disponíveis
    to_port          = 0
    protocol         = "-1" #-1 => todos os protocolos
  }
  tags = {
    name = "default access ${var.env_name}"
  }
}
