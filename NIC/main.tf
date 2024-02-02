resource "azurerm_network_interface" "nic108app" {
  for_each            = var.nic5678
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  ip_configuration {
    name                          = "internal"
    subnet_id                     = each.value.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = each.value.public_ip_address_id
    
  
  }

}


