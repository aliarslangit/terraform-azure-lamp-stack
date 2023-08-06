
terraform {

required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.67.0"  # Replace this with the desired version constraint
    }
    # Add other required providers if needed
  }
#   backend "azurerm" {

#     # Provide details for the storage account to store state file
#     resource_group_name  = "rg-terraform"
#     storage_account_name = "terraformst"
#     container_name       = "tfstate"
#     key                  = "terraform.tfstate"
#     use_oidc             = true
# }
}


provider "azurerm" {
  
  # Provide detailes for the service principal to authenticate
  subscription_id = ""
  client_id       = ""
  client_secret   = ""
  tenant_id       = ""

  features {}
}