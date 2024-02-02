resource "azurerm_virtual_network" "appvnetthreetier" {
  for_each            = var.appvet01
  name                = each.key
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  address_space       = ["10.0.0.0/16"]

}