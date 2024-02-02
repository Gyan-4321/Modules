data "azurerm_subnet" "bastion" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = "apprg1"
  virtual_network_name = "appvnet20"
}
