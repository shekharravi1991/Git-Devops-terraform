terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

resource "azurerm_role_assignment" "reader_assignment" {
  scope                = "/subscriptions/c1cbeea8-7285-442a-b427-322fa6c81cff"
  role_definition_name = "Reader"
  principal_id         = var.principal_id
}

resource "azurerm_role_assignment" "contributor_assignment" {
  scope                = "/subscriptions/c1cbeea8-7285-442a-b427-322fa6c81cff"
  role_definition_name = "Contributor"
  principal_id         = var.principal_id
}

resource "azurerm_role_assignment" "owner_assignment" {
  scope                = "/subscriptions/c1cbeea8-7285-442a-b427-322fa6c81cff"
  role_definition_name = "Owner"
  principal_id         = var.principal_id
}