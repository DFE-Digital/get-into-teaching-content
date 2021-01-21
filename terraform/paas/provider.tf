provider "cloudfoundry" {
  api_url  = var.api_url
  user     = local.devops_secrets["PAAS_USERNAME"]
  password = local.devops_secrets["PAAS_PASSWORD"]
}

provider statuscake {
  username = local.devops_secrets["SC_USERNAME"]
  apikey   = local.devops_secrets["SC_PASSWORD"]
}

locals {
  azure_credentials      = jsondecode( var.AZURE_CREDENTIALS )
}

provider "azurerm" {
  version                    = ">= 2.0"
  skip_provider_registration = true
  features {}
  subscription_id = local.azure_credentials.subscriptionId
  client_id       = local.azure_credentials.clientId
  client_secret   = local.azure_credentials.clientSecret
  tenant_id       = local.azure_credentials.tenantId
}

terraform {
  required_version = ">= 0.13.4"

  required_providers {
    cloudfoundry = {
      source  = "cloudfoundry-community/cloudfoundry"
      version = "0.12.6"
    }
    statuscake = {
      source  = "thde/statuscake"
      version = "1.1.3"
    }
  }
}
