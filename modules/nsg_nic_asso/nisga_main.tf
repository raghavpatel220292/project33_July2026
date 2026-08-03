data "azurerm_network_interface" "data_nic" {
  for_each = var.nisgasso

  name                = each.value.nic_name
  resource_group_name = each.value.rgname
}

data "azurerm_network_security_group" "data_nsg" {
  for_each = var.nisgasso

  name                = each.value.nsg_name
  resource_group_name = each.value.rgname
}


resource "azurerm_network_interface_security_group_association" "nis_asso" {
  for_each = var.nisgasso

  network_interface_id      = data.azurerm_network_interface.data_nic[each.key].id
  network_security_group_id = data.azurerm_network_security_group.data_nsg[each.key].id
}