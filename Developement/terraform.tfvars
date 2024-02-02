appthreetier = {
  rg1 = {
    name     = "apprg1"
    location = "central india"

  }
}

appvet01 = {
  appvnet20 = {
    resource_group_name = "apprg1"
    location            = "central india"

  }

}

appsubnet = {
  frontend1 = {
    resource_group_name  = "apprg1"
    location             = "central india"
    virtual_network_name = "appvnet20"
    address_prefixes     = ["10.0.1.0/24"]
  },
  backend2 = {
    resource_group_name  = "apprg1"
    location             = "central india"
    virtual_network_name = "appvnet20"
    address_prefixes     = ["10.0.2.0/24"]
  },
  AzureBastionSubnet = {
    resource_group_name  = "apprg1"
    location             = "central india"
    virtual_network_name = "appvnet20"
    address_prefixes     = ["10.0.3.0/24"]
  }
}

nic5678 = {
  mytestnic453 = {
    name                 = "frontend1-nic"
    resource_group_name  = "apprg1"
    location             = "central india"
    subnet_id            = "/subscriptions/72ee3a3e-b0e7-4ff8-bc38-e52666770035/resourceGroups/apprg1/providers/Microsoft.Network/virtualNetworks/appvnet20/subnets/frontend1"
    public_ip_address_id = "/subscriptions/72ee3a3e-b0e7-4ff8-bc38-e52666770035/resourceGroups/apprg1/providers/Microsoft.Network/publicIPAddresses/frontend1vmpip"
  },
  mytestnic454 = {
    name                 = "backend1-nic"
    resource_group_name  = "apprg1"
    location             = "central india"
    subnet_id            = "/subscriptions/72ee3a3e-b0e7-4ff8-bc38-e52666770035/resourceGroups/apprg1/providers/Microsoft.Network/virtualNetworks/appvnet20/subnets/backend2"
    public_ip_address_id = "/subscriptions/72ee3a3e-b0e7-4ff8-bc38-e52666770035/resourceGroups/apprg1/providers/Microsoft.Network/publicIPAddresses/backend1vmpip"
  }

}
appvm3 = {
  vm1 = {
    name                  = "frontendvm1"
    resource_group_name   = "apprg1"
    location              = "central india"
    size                  = "Standard_B1s"
    network_interface_ids = "/subscriptions/72ee3a3e-b0e7-4ff8-bc38-e52666770035/resourceGroups/apprg1/providers/Microsoft.Network/networkInterfaces/frontend1-nic"
  },
  vm2 = {
    name                  = "Backendvm1"
    resource_group_name   = "apprg1"
    location              = "central india"
    size                  = "Standard_B1s"
    network_interface_ids = "/subscriptions/72ee3a3e-b0e7-4ff8-bc38-e52666770035/resourceGroups/apprg1/providers/Microsoft.Network/networkInterfaces/backend1-nic"
  }
}

Loadbalancer = {
  vm1 = {
    name                = "frontendvm1"
    resource_group_name = "apprg1"
  },

  vm2 = {
    name                = "backendvm1"
    resource_group_name = "apprg1"
  }
}

vmpips = {
  pip1 = {
    name                = "frontend1vmpip"
    resource_group_name = "apprg1"
    location            = "central india"

  },

  pip2 = {
    name                = "backend1vmpip"
    resource_group_name = "apprg1"
    location            = "central india"

  }
}

sg={
  sg1={
    name="rule1"
    priority="101"
    port="80"
    protocol="tcp"
  },
  sg2={
    name="rule2"
    priority="100"
    port="22"
    protocol="ssh"
  }

}



