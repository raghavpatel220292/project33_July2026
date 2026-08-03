data "azurerm_subnet" "data-sub" {
  for_each             = var.bast
  name                 = each.value.sub_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.rg_name
}


data "azurerm_public_ip" "data-pip" {
  for_each            = var.bast
  name                = each.value.pip_name
  resource_group_name = each.value.rg_name
}


resource "azurerm_bastion_host" "bastion" {
  for_each            = var.bast
  name                = each.value.bastion_name
  location            = each.value.location
  resource_group_name = each.value.rg_name

  ip_configuration {
    name                 = each.value.ip_name
    subnet_id            = data.azurerm_subnet.data-sub[each.key].id
    public_ip_address_id = data.azurerm_public_ip.data-pip[each.key].id
  }
}