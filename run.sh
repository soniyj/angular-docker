# Build Image
docker build -t example:dev .

# Run Container
docker run -v ${PWD}:/app -v /app/node_modules -p 4201:4200 --rm example:dev

# Run Container in Background with name
docker run -d -v ${PWD}:/app -v /app/node_modules -p 4201:4200 --name myapp --rm example:dev

# Run Tests
docker exec -it myapp ng test --watch=false
docker exec -it myapp ng e2e --port 4202

# Stop Container
docker stop myapp

# Docker Compose
docker-compose up -d --build

# Docker Compose Tests
docker-compose exec example ng test --watch=false
docker-compose exec example ng e2e --port 4202

# Stop Compose
docker-compose [down | stop]

### Production

# Build Image
docker build -f Dockerfile-prod -t example:prod .

# Run Container
docker run -it -p 80:80 --rm example:prod

# Docker Compose
docker-compose -f docker-compose-prod.yml up -d --build