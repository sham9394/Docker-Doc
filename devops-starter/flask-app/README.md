# Flask App (Beginner)

## Build
```bash
docker build -t flask-app:local ./flask-app
```

## Run (docker)
```bash
docker run -p 5000:5000 flask-app:local
```

## Run (compose)
```bash
docker-compose up --build flask-app
```

## Kubernetes
```bash
kubectl apply -f k8s/flask-deployment.yaml
```
