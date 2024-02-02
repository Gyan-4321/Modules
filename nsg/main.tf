resource "azurerm_network_security_group" "NSG" {
  name                = "nsg1"
  location            = "central india"
  resource_group_name = "apprg1"

  dynamic "security_rule" {
    for_each = var.sg
    content {
      name                       = security_rule.value.name
      priority                   = security_rule.value.priority
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = security_rule.value.protocol
      source_port_range          = "*"
      destination_port_range     = security_rule.value.destination_port_range
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  }

  
}