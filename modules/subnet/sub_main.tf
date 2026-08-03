resource "azurerm_subnet" "subnet" {
  for_each = var.subs

  name                 = each.value.sub_name
  resource_group_name  = each.value.rgname
  virtual_network_name = each.value.vnet_name
  address_prefixes     = each.value.addprefix
}