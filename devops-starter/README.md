# DevOps Starter - 6 Apps

This repo contains 6 small starter apps (Flask, Node, Spring Boot, Go, React, Static HTML),
Dockerfiles, Kubernetes manifests (with example Ingress), and a docker-compose.yml.

## Quick commands

### Build all images (locally)
```bash
docker build -t flask-app:latest ./flask-app
docker build -t node-app:latest ./node-app
docker build -t spring-app:latest ./spring-app
docker build -t go-app:latest ./go-app
docker build -t react-app:latest ./react-app
docker build -t html-site:latest ./html-site
```

### Run with docker-compose
```bash
docker-compose up --build
```

### Kubernetes (use Docker images pushed to registry OR use local kind cluster with imageLoad)
```bash
# apply each app manifest
kubectl apply -f k8s/

# If you use an ingress controller (nginx), update hosts file with:
# 127.0.0.1 apps.example.com
```

## Notes
- Each k8s Deployment expects images with names like `flask-app:latest` etc. In production push to a registry.
- Ingress uses host `apps.example.com` and paths like `/flask`, `/node`, `/spring`, etc.
