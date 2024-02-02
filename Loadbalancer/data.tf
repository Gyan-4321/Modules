data "azurerm_resource_group" "application3tier" {
  name = "apprg1"
}

data "azurerm_virtual_network" "appvnetthreetier" {
  name                = "appvnet20"
  resource_group_name = "apprg1"
}

data "azurerm_virtual_machine" "myvm" {
  name                = "frontendvm1"
  resource_group_name = "apprg1"

}

data "azurerm_virtual_machine" "ghi" {

  name                = "backendvm1"
  resource_group_name = "apprg1"
}

data "azurerm_network_interface" "example" {
  name                = "frontend1-nic"
  resource_group_name = "apprg1"
}

data "azurerm_network_interface" "jkl" {
  name                = "backend1-nic"
  resource_group_name = "apprg1"
}