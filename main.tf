#Provisioning a Resource Group
module "rg" {
  source   = "./modules/management/azure_resource_group"
  rgname   = var.rgname
  location = var.location
}

#Provisioning a Virtual Network
module "vnet"{
  source = "./modules/network/azure_vnet"
  rgname = module.rg.resource_group_name

  location = var.location
  vnetname = var.vnetname
  address_space = var.address_space
  subnets = var.subnets
}

#Provisioning a Linux Virtual Machine
module "vm" {
  source = "./modules/compute/Azure VM"
  rgname = module.rg.resource_group_name
  vmname = var.vmname
  location = var.location
  publisher = var.publisher
  offer = var.offer
  sku = var.sku
  vmsize = var.vmsize
  subnet_id = lookup(module.vnet.subnet_ids,var.subnet_name)
  adminuser = var.vmuser
  adminpassword = var.vmpassword
}

#Provisioning a MySQL DB Instance
module "mysql" {
  source = "./modules/storage/azureMySql"
  rgname = module.rg.resource_group_name
  location = var.location
  db_server_name = var.db_server_name
  db_name = var.db_name
  db_size = var.db_size
  username = var.dbusername
  password = var.dbpassword
}


