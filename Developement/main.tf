module "resource_group" {
  source       = "../../Modules/Resourcegroup"
  appthreetier = var.appthreetier

}

module "vnet" {
  source     = "../../Modules/Virtualnetwork"
  appvet01   = var.appvet01
  depends_on = [module.resource_group]

}

module "subnet" {
  source     = "../../Modules/Subnet"
  appsubnet  = var.appsubnet
  depends_on = [module.vnet]


}

module "nic" {
  source     = "../../Modules/NIC"
  nic5678    = var.nic5678
  depends_on = [module.resource_group, module.subnet]


}

module "Virtualmachines" {
  source     = "../../Modules/Virtualmachine"
  appvm3     = var.appvm3
  depends_on = [module.resource_group, module.nic]


}
module "LB" {
  source     = "../../Modules/Loadbalancer"
  vms        = var.Loadbalancer
  depends_on = [module.Virtualmachines, module.resource_group]


}

module "public_ip" {
  source     = "../../Modules/Publicip"
  vmpips     = var.vmpips
  depends_on = [module.resource_group]

}

module "azurebastion" {
  source = "../../Modules/bastionhost"
  depends_on = [ module.resource_group,module.subnet ]
}