#terraform script to create VM
resource "azurerm_public_ip" "linuxvm" {
  name                = "${var.vmname}-ip"
  location            = var.location
  resource_group_name = var.rgname
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "linuxvm" {
  name                = "${var.vmname}-nic"
  location            = var.location
  resource_group_name = var.rgname

  ip_configuration {
    name                          = "ipconfig"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.linuxvm.id


  }
}
resource "azurerm_virtual_machine" "linuxvm" {
  name                             = "${var.vmname}-vm"
  location                         = var.location
  resource_group_name              = var.rgname
  network_interface_ids            = [azurerm_network_interface.linuxvm.id]
  vm_size                          = var.vmsize
  delete_os_disk_on_termination    = true #to preserve os-disk after deletion, set this poperty to false
  delete_data_disks_on_termination = true #to preserve data-disk after deletion, set this poperty to false
  custom_data                       = filebase64("lamp.sh")   #Setting up LAMP

  #Windows or marketplace images can be used as per the requirements
  storage_image_reference {
    publisher = var.publisher
    offer     = var.offer
    sku       = var.sku
    version   = "latest"
  }

  storage_os_disk {
    name              = "${var.vmname}-osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "hostname"
    admin_username = var.adminuser
    admin_password = var.adminpassword
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = {
    environment = var.environment
    owner = var.owner
    createdon = var.creationdate
  }

}

