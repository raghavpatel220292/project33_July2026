data "azurerm_network_interface" "data_vm-nic" {
  for_each = var.vms

  name                = each.value.nic_name
  resource_group_name = each.value.rgname
}


resource "azurerm_windows_virtual_machine" "VM" {

    
  for_each = var.vms

  name                = each.value.vm_name
  resource_group_name = each.value.rgname
  location            = each.value.location
  size                = each.value.size
  admin_username      = each.value.admin_username 
  admin_password      = each.value.admin_password
  network_interface_ids = [data.azurerm_network_interface.data_vm-nic[each.key].id]
  provision_vm_agent = true
  patch_mode         = "AutomaticByPlatform"


  os_disk {
    caching              = each.value.caching
    storage_account_type = each.value.storage_account_type
  }

  source_image_reference {
    publisher = each.value.publisher
    offer     = each.value.offer
    sku       = each.value.sku
    version   = each.value.version
  }
}