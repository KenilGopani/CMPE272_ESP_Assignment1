# CMPE272: Enterprise Software Platforms
#### Assignment 1: Hello World Microservices Application
#### Author: Kenil G Gopani
#### SJSU ID: 017992624
#### Guidance by: Prof. Rakesh Ranjan
# Microservices with Spring Boot, Docker, and Kubernetes

## Prerequisites

- **Java 21** installed
- **Maven 3.9.9** or higher
- **Docker** installed
- **Kubernetes** and **Minikube** installed

## Project Structure

- **hello-service**: A Spring Boot microservice that returns "Hello".
- **world-service**: A Spring Boot microservice that returns "World".


## How to execute individual micro-services

### 1. Execute hello-service/ 

- Move into hello-service/src/main/java/com/hello_service/<br>
- Run HelloServiceApplication.java/ file into IntelliJ IDEA CE IDE<br>
- Application will run on http://localhost:8081/hello
  
### 2. Execute hello-service/ 
- Move into world-service/src/main/java/com/world_service/<br>
- Run WorldServiceApplication.java/ file into IntelliJ IDEA CE IDE<br>
- Application will run on http://localhost:8082/world


### 3. Create Docker image
- Open terminal<br>
- Run command "docker build -t hello-service:latest ." to build the helloservice image.<br>
- Run command "docker build -t world-service:latest ." to build the worldservice image.<br>
- Execute command named "docker image ls" to check created images?<br>

### 4. Create a repository in Docker Hub

- Push Created images to Docker Hub: https://hub.docker.com/<br>
- My Docker repository link: https://hub.docker.com/repositories/kenilgopanisjsu
- https://hub.docker.com/repository/docker/kenilgopanisjsu/hello-service/general
- https://hub.docker.com/repository/docker/kenilgopanisjsu/world-service/general

### 5. Push Docker images into Docker Hub

- Use docker tag to rename the docker image with username
-  Now run the docker push command.


### 6. Deploying the application on Kubernetes

-	Go to terminal start minikub cluster using "minikube start" .<br>
- Verify minikub status "minikube status" .<br>
- Apply Deployment and Service Manifests for hello-service and world-service
  - kubectl apply -f hello-deployment.yaml
  - kubectl apply -f hello-service.yaml
  - kubectl apply -f world-deployment.yaml
  - kubectl apply -f world-service.yaml
- Verify Deployments and Services using "kubectl get pods"

- Accessing Services
    • Forward ports to access services from your local machine:
    - kubectl port-forward service/hello-service 8081:8081
    - kubectl port-forward service/world-service 8082:8082
- Access Services:
    • Open your web browser and navigate to:
    - http://localhost:8081 (Hello Service)
    - http://localhost:8082 (World Service)

-	Testing and integration of Services with combined.sh
  - Execute "./combined.sh" in terminal
  - It will  port-forward both service and will return output "Hello World"
