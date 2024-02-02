resource "azurerm_resource_group" "application3tier" {
  for_each = var.appthreetier
  name     = each.value.name
  location = each.value.location
}