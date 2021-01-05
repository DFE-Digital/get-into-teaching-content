paas_space                 = "get-into-teaching-test"
paas_app_application_name  = "get-into-teaching-app-test"
paas_app_route_name        = "get-into-teaching-app-test"
paas_redis_1_name          = "get-into-teaching-test-redis-svc"
paas_additional_route_name = "staging-getintoteaching"
additional_routes          = 1

alerts = {
  GiT_App_Staging_Healthcheck = {
    website_name  = "Get Into Teaching Website (Staging)"
    website_url   = "https://get-into-teaching-app-test.london.cloudapps.digital/healthcheck.json"
    test_type     = "HTTP"
    check_rate    = 60
    contact_group = [185037]
    trigger_rate  = 0
    custom_header = "{\"Content-Type\": \"application/x-www-form-urlencoded\"}"
  }
}
