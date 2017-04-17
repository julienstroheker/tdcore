# Configure the Microsoft Azure Provider
provider "azurerm" {
  subscription_id = "b62d7cd1-18ca-426f-b5c5-1e9cdaa4d0d1"
  client_id       = "fa03ace1-62f8-4d81-ba2f-3f4f1d5169e4"
  client_secret   = "Qwertyuiop123."
  tenant_id       = "72f988bf-86f1-41af-91ab-2d7cd011db47"
}

# Create a resource group
resource "azurerm_resource_group" "production" {
  name     = "production"
  location = "West US"
}

# Create a virtual network in the web_servers resource group
resource "azurerm_virtual_network" "network" {
  name                = "productionNetwork"
  address_space       = ["10.0.0.0/16"]
  location            = "West US"
  resource_group_name = "${azurerm_resource_group.production.name}"

  subnet {
    name           = "subnet4"
    address_prefix = "10.0.4.0/24"
  }

  subnet {
    name           = "subnet2"
    address_prefix = "10.0.2.0/24"
  }

  subnet {
    name           = "subnet3"
    address_prefix = "10.0.3.0/24"
  }
}