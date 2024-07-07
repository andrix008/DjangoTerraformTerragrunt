provider "local" {
  # This is required to use the local-exec provisioner
}

resource "null_resource" "minikube" {
  provisioner "local-exec" {
    command = <<EOT
      minikube start --driver=docker
    EOT
  }

  provisioner "local-exec" {
    when    = destroy
    command = "minikube stop"
  }
}

output "minikube_status" {
  value = "Minikube is running with Docker driver"
}
