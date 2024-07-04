provider "kubernetes" {
  config_path = "~/.kube/config"
}

resource "kubernetes_deployment" "django_deployment" {
  metadata {
    name = var.deployment_name
  }
  spec {
    replicas = var.replicas
    selector {
      match_labels = {
        app = var.app_label
      }
    }
    template {
      metadata {
        labels = {
          app = var.app_label
        }
      }
      spec {
        container {
          image = var.image
          name  = var.container_name
          port {
            container_port = var.container_port
          }
          image_pull_policy = var.image_pull_policy
        }
      }
    }
  }
}
