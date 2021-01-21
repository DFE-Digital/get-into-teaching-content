data azurerm_key_vault vault {
  name                = var.azure_key_vault
  resource_group_name = var.azure_resource_group
}

data azurerm_key_vault_secret Application {
  key_vault_id = data.azurerm_key_vault.vault.id
  name         = "CONTENT-KEYS"
}

data azurerm_key_vault_secret DevOps {
  key_vault_id = data.azurerm_key_vault.vault.id
  name         = "COMMON-KEYS"
}

locals {
  devops_secrets      = jsondecode(data.azurerm_key_vault_secret.DevOps.value)
  application_secrets = jsondecode(data.azurerm_key_vault_secret.Application.value)
}
