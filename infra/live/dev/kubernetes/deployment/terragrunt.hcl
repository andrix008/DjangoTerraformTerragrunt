terraform {
  source = "../../../../modules/kubernetes/deployment"
}

inputs = {
  deployment_name   = "django-deployment"
  replicas          = 3
  app_label         = "django"
  image             = "webapp:latest"
  container_name    = "django"
  container_port    = 8000
  image_pull_policy = "IfNotPresent"
}
