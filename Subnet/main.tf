resource "azurerm_subnet" "appsubnetthreetier" {
  for_each             = var.appsubnet
  name                 = each.key
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
  address_prefixes     = each.value.address_prefixes
}