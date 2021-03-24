data "cloudfoundry_route" "app_route_internet" {
  domain   = data.cloudfoundry_domain.internet.id
  count    = length(var.paas_additional_route_names)
  hostname = var.paas_additional_route_names[count.index]
}

resource "cloudfoundry_route" "app_route_cloud" {
  domain   = data.cloudfoundry_domain.cloudapps.id
  hostname = var.paas_app_route_name
  space    = data.cloudfoundry_space.space.id
}

resource "cloudfoundry_route" "app_route_internal" {
  domain   = data.cloudfoundry_domain.internal.id
  hostname = "${var.paas_app_route_name}-internal"
  space    = data.cloudfoundry_space.space.id
}

