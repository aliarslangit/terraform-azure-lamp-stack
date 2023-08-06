# Terraform Module: Azure LAMP Stack

This Terraform module creates a LAMP (Linux, Apache, MySQL, PHP) stack on Azure. 
## Table of Contents

- [Terraform Module: Azure LAMP Stack](#terraform-module-azure-lamp-stack)
  - [Table of Contents](#table-of-contents)
  - [Description](#description)
  - [Prerequisites](#prerequisites)
  - [Usage](#usage)
    - [Terraform Version](#terraform-version)
    - [Providers](#providers)
    - [Inputs](#inputs)
    - [Outputs](#outputs)
  - [Examples](#examples)
  - [Variables](#variables)
  - [Outputs](#outputs)
  - [License](#license)
  - [Contributing](#contributing)
  - [Authors](#authors)

## Description

This Terraform module creates a basic cloud environment needed to run a LAMP stack on Azure.
The module provisions an Azure Virtual Machine running Linux, installs Apache and PHP and povisions a PaaS MySQL DB instance.

## Prerequisites

- An Azure account and an active subscription.
- Terraform installed on your local machine (version 0.12 or later).
- Azure CLI installed and configured on your local machine.

## Usage

### Terraform Version

This module requires Terraform 0.12 or later.

### Providers

The module uses the following providers:

- [azurerm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)

### Inputs

The following input variables are available in this module:

| Name                      | Description                                           | Type   |          Default                      | Required |
|---------------------------|-------------------------------------------------------|--------|---------------------------------------|----------|
| `rgname`                  | The name of the Azure resource group to be created.   | string | `"rg-lamp"`                           | no       |
| `location`                | The Azure region where resources will be provisioned. | string | `"East US"`                           | no       |
| `vnetname`                | The name of the Azure Virtual Network.                | string | `"vnet-lamp"`                         | no       |
| `address_space`           | The address space for the Azure Virtual Network.      | list   | `"[ "10.8.0.0/14" ]"`                 | no       |
| `subnets`                 | The subnets and their address spaces.                 | map    | `"{ "lamp-subnet"="10.8.0.0/17" }"`   | no       |
| `vmname`                  | The name of the Azure Virtual Machine.                | string | `"vm-lamp"`                           | no       |
| `subnet_name`             | The name of the subnet for the Azure Virtual Machine. | string | `"lamp-subnet"`                       | no       |
| `vmsize`                  | The size of the Azure Virtual Machine.                | string | `"Standard_DS2_v2"`                   | no       |   
| `vmuser`                  | The username for logging into the Virtual Machine.    | string | `"azureuser"`                         | no       |
| `vmpassword`              | The password for the Virtual Machine.                 | string |                                       | YES      |
| `db_server_name`          | The name of the Azure MySQL server.                   | string | `"lampservermysql"`                   | no       |
| `db_name`                 | The name of the Database to be created in DB server.  | string | `"dblamp"`                            | no       |
| `db_size`                 | The size of the database.                             | string | `"5120"`                              | no       |
| `dbusername`              | The username for logging into the Azure MySQL server. | string | `"azureuser"`                         | no       |
| `dbpassword`              | The password for the Azure MySQL server instance.     | string |                                       | YES      |
### Outputs

The module provides the following outputs:

| Name                      | Description                                           |
|---------------------------|-------------------------------------------------------|
| `virtual_machine_ip`      | The public IP address of the Azure Virtual Machine.  |

## Examples

You can use this module as follows:

```hcl
module "lamp_stack" {
 source = "github.com/aliarslangit/azure-terraform-lamp-stack"
 rgname=   "rg-lamp"
 location= "East US"
 vmname=   "lamp-vm"
 vmuser=  "azureuser"
 vmpassword =""
 vmsize="Standard_DS2_v2"
 vnetname = "vnet-lamp"
 address_space=[ "10.8.0.0/14" ]
 subnets={"lamp-subnet"="10.8.0.0/17"}
 db_size= "5120"
 db_name="dblamp"
 subnet_name="lamp-subnet"
 db_server_name="lampservermysql"
 dbusername= "azureuser"
 dbpassword=""
}


