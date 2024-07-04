provider "kubernetes" {
  config_path = "~/.kube/config"
}

resource "kubernetes_service" "django_service" {
  metadata {
    name = var.service_name
  }
  spec {
    selector = {
      app = var.app_label
    }
    port {
      port        = var.port
      target_port = var.target_port
    }
    type = var.service_type
  }
}
