# Django App deployed with Terraform/Terragrunt on a local Minikube Cluster

This `README.md` provides a comprehensive guide for setting up, deploying, and destroying your Django application on Minikube using Terragrunt. It includes prerequisites, detailed steps, and the necessary file contents for your project structure.

## Installation

1. **Start Minikube:**

    ```sh
    minikube start
    ```

2. **Configure Docker to Use Minikube's Docker Daemon:**

    ```sh
    & minikube -p minikube docker-env --shell powershell | Invoke-Expression
    ```

3. **Build Docker Image:**

    ```sh
    docker build -t webapp:latest .
    ```

4. **Verify the Image in Minikube:**

    ```sh
    docker images
    ```

## Deployment

1. **Deploy with Terragrunt:**

    - Navigate to the deployment directory and run `terragrunt apply`:

        ```sh
        cd infra/live/dev/kubernetes/deployment
        terragrunt apply
        ```

    - Navigate to the service directory and run `terragrunt apply`:

        ```sh
        cd ../service
        terragrunt apply
        ```

2. **Access Your Application:**

    ```sh
    minikube service django-service
    ```

## Destroy Infrastructure

1. **Destroy the Kubernetes Deployment:**

    ```sh
    cd infra/live/dev/kubernetes/deployment
    terragrunt destroy
    ```

2. **Destroy the Kubernetes Service:**

    ```sh
    cd ../service
    terragrunt destroy
    ```
