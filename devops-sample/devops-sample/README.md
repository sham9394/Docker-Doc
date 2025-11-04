# DevOps Sample Project

This repo contains a tiny Node.js app and full sample DevOps configuration:
- Dockerfile
- docker-compose.yml
- Kubernetes manifests
- Ansible playbook
- Jenkinsfile
- Terraform example

Docker image placeholder: shamchaudhari/devops-sample:1.0

Run locally (Ubuntu):
1. Build image:
   docker build -f docker/Dockerfile -t shamchaudhari/devops-sample:1.0 .
2. Run with docker-compose:
   docker-compose up -d --build
3. Access: http://localhost/

Generated on 2025-11-03T10:23:34.101993 UTC
