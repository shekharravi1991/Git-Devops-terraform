
resource "azurerm_resource_group" "logicapp_rg" {
  name     = "rg-logicapp-demo"
  location = var.location
}

resource "azurerm_storage_account" "logicapp_sa" {
  name                     = "logicappstorageacct"
  resource_group_name      = azurerm_resource_group.logicapp_rg.name
  location                 = azurerm_resource_group.logicapp_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_resource_group_template_deployment" "logicapp_deployment" {
  name                = "logicapp-deployment"
  resource_group_name = azurerm_resource_group.logicapp_rg.name
  deployment_mode     = "Incremental"

  template_content = file("${path.module}/logicapp-template.json")

  parameters_content = jsonencode({
    logicAppName = {
      value = "demo-logic-app"
    }
    location = {
      value = var.location
    }
  })
}
