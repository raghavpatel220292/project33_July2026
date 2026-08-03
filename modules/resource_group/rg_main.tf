resource "azurerm_resource_group" "rgs" {
    for_each = var.rg
    name = each.value.rg_name
    location = each.value.loc
}