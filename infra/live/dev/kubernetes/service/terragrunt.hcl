terraform {
  source = "../../../../modules/kubernetes/service"
}

inputs = {
  service_name = "django-service"
  app_label    = "django"
  port         = 80
  target_port  = 8000
  service_type = "NodePort"
}
