resource "cloudfoundry_app" "app_application" {
    name         = var.paas_app_application_name
    space        = data.cloudfoundry_space.space.id
    docker_image = var.paas_app_docker_image
    stopped      = var.application_stopped
    strategy     = var.strategy
    memory       = 1024
    timeout      = 900
    dynamic "service_binding" {
      for_each = data.cloudfoundry_user_provided_service.logging
      content {
        service_instance = service_binding.value["id"]
      }
    }
    routes { route = cloudfoundry_route.app_route_internal.id }
    dynamic "routes" {
      for_each = data.cloudfoundry_route.app_route_internet
      content {
        route = routes.value["id"]
      }
    }
    environment = {
          HTTPAUTH_PASSWORD = var.HTTPAUTH_PASSWORD
          HTTPAUTH_USERNAME = var.HTTPAUTH_USERNAME
          RAILS_ENV = var.RAILS_ENV
          RAILS_MASTER_KEY = var.RAILS_MASTER_KEY
          DOES_NOTHING = var.DUMMY
    }    
}

