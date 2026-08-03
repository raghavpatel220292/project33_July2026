data "azurerm_subnet" "data-sub" {
  for_each             = var.nics
  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.rgname
}



resource "azurerm_network_interface" "nic" {

  for_each            = var.nics
  name                = each.value.nic_name
  location            = each.value.loc
  resource_group_name = each.value.rgname

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.data-sub[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}