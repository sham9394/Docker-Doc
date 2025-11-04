provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "devops_host" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name

  user_data = <<-EOF
              #!/bin/bash
              apt-get update -y
              apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release
              curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
              echo "deb [signed-by=/usr/share/keyrings/docker-archive-keyring.gpg arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list
              apt-get update -y
              apt-get install -y docker-ce docker-ce-cli containerd.io
              usermod -aG docker ubuntu
              mkdir -p /opt/devops-sample
              docker run -d --name hello-nginx -p 80:80 nginx:stable-alpine
              EOF

  tags = {
    Name = "devops-sample-host"
  }
}
