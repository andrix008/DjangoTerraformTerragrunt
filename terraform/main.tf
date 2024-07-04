# Configure the Kubernetes provider
provider "kubernetes" {
  config_path = "~/.kube/config"
}

# Define the Kubernetes Deployment resource
resource "kubernetes_deployment" "django_deployment" {
  metadata {
    name = "django-deployment"
  }
  spec {
    replicas = 3
    selector {
      match_labels = {
        app = "django"
      }
    }
    template {
      metadata {
        labels = {
          app = "django"
        }
      }
      spec {
        container {
          image = "webapp:latest"
          name  = "django"
          port {
            container_port = 8000
          }
          image_pull_policy = "IfNotPresent"
        }
      }
    }
  }
}

# Define the Kubernetes Service resource
resource "kubernetes_service" "django_service" {
  metadata {
    name = "django-service"
  }
  spec {
    selector = {
      app = "django"
    }
    port {
      port        = 80
      target_port = 8000
    }
    type = "NodePort"
  }
}
