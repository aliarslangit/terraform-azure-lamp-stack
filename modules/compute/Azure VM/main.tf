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
resource "azurerm_linux_virtual_machine" "linuxvm" {
  name                = var.vmname
  resource_group_name = var.rgname
  location            = var.location
  size                = var.vmsize
  admin_username      = var.vmuser
  admin_password      = var.vmpassword
  custom_data = <<-EOT
#!/bin/bash

#Install Apache
sudo apt update
sudo apt install apache2 -y

#Allow apache from firewall
sudo ufw app list
sudo ufw allow in "Apache"
sudo ufw status

#Install mysql
sudo apt install mysql-server -y


#Install php
sudo apt install php libapache2-mod-php php-mysql -y

#Verify Installations
 php -v
 apache2 -v
 sudo mysql

# Output LAMP stack details
echo "LAMP stack installation complete!"
echo "Apache installed and running."
echo "PHP installed and configured."
  EOT
  network_interface_ids = [
    azurerm_network_interface.linuxvm.id,
  ]
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = var.publisher
    offer     = var.offer
    sku       = var.sku
    version   = "latest"
  }
}
