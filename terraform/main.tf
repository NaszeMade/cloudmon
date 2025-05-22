provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "cloudmon" {
  name     = "cloudmon-rg"
  location = "East US"
}

resource "azurerm_storage_account" "cloudmon" {
  name                     = "cloudmonstorage"
  resource_group_name      = azurerm_resource_group.cloudmon.name
  location                 = azurerm_resource_group.cloudmon.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}