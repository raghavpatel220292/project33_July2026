resource "azurerm_virtual_network" "vnet" {
  for_each            = var.vnets
  name                = each.value.vnet_name
  location            = each.value.loc
  resource_group_name = each.value.rgname
  address_space       = each.value.addspace
}