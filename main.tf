resource "azurerm_resource_group" "rgs" {
  name     = "test-rg100"
  location = "centralindia"
}

resource "azurerm_virtual_network" "vnets" {
  name                = "test-vnet100"
  resource_group_name = "test-rg100"
  location            = "centralindia"
  address_space       = ["10.40.0.0/16"]
}
