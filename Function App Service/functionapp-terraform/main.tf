resource "azurerm_resource_group" "function_rg" {
  name     = "rg-functionapp-demo"
  location = var.location
}

resource "azurerm_storage_account" "function_storage" {
  name                     = "funcappstorageacct"
  resource_group_name      = azurerm_resource_group.function_rg.name
  location                 = azurerm_resource_group.function_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_app_service_plan" "function_plan" {
  name                = "function-app-plan"
  location            = azurerm_resource_group.function_rg.location
  resource_group_name = azurerm_resource_group.function_rg.name

  sku {
    tier = "Dynamic"
    size = "Y1"
  }

  kind = "FunctionApp"
}

resource "azurerm_linux_function_app" "function_app" {
  name                       = "demo-function-app"
  location                   = azurerm_resource_group.function_rg.location
  resource_group_name        = azurerm_resource_group.function_rg.name
  service_plan_id            = azurerm_app_service_plan.function_plan.id
  storage_account_name       = azurerm_storage_account.function_storage.name
  storage_account_access_key = azurerm_storage_account.function_storage.primary_access_key

  site_config {
    application_stack {
      node_version = "18"
    }
  }

  app_settings = {
    "FUNCTIONS_WORKER_RUNTIME" = "node"
    "WEBSITE_RUN_FROM_PACKAGE" = "1"
  }
}