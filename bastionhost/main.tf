resource "azurerm_public_ip" "example" {
  name                = "examplepip"
  location            = "central india"
  resource_group_name = "apprg1"
  allocation_method   = "Static"
  sku                 = "Standard"
}



resource "azurerm_bastion_host" "bastionforvm" {
  name                = "mybastion"
  location            = "central india"
  resource_group_name = "apprg1"



  ip_configuration {
    name                 = "configuration"
    subnet_id            = data.azurerm_subnet.bastion.id
    public_ip_address_id = azurerm_public_ip.example.id
  }
}