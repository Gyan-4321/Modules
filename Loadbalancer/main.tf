resource "azurerm_public_ip" "LBPIP" {
  name                = "PublicIPForLB"
  location            = data.azurerm_resource_group.application3tier.location
  resource_group_name = data.azurerm_resource_group.application3tier.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_lb" "LB" {
  name                = "TestLoadBalancer"
  location            = data.azurerm_resource_group.application3tier.location
  resource_group_name = data.azurerm_resource_group.application3tier.name
  sku                 = "Standard"

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.LBPIP.id
  }
}

resource "azurerm_lb_backend_address_pool" "backpool" {
  loadbalancer_id = azurerm_lb.LB.id
  name            = "BackEndAddressPool"
}



resource "azurerm_lb_backend_address_pool_address" "example1" {
  name                    = "address1"
  backend_address_pool_id = azurerm_lb_backend_address_pool.backpool.id
  virtual_network_id      = data.azurerm_virtual_network.appvnetthreetier.id
  ip_address              = data.azurerm_network_interface.example.private_ip_address
}

resource "azurerm_lb_backend_address_pool_address" "example2" {
  name                    = "address2"
  backend_address_pool_id = azurerm_lb_backend_address_pool.backpool.id
  virtual_network_id      = data.azurerm_virtual_network.appvnetthreetier.id
  ip_address              = data.azurerm_network_interface.jkl.private_ip_address
}



resource "azurerm_lb_probe" "lbprob" {
  loadbalancer_id = azurerm_lb.LB.id
  name            = "ssh-running-probe"
  port            = 22
}
resource "azurerm_lb_rule" "rule" {
  loadbalancer_id                = azurerm_lb.LB.id
  name                           = "frontendRule"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "PublicIPAddress"
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.backpool.id]
  probe_id                       = azurerm_lb_probe.lbprob.id
}
