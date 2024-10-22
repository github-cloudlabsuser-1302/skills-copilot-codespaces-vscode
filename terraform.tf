cprovider "azurerm" {
  features {}
}
c
variable "storage_account_name" {
  description = "Name of the storage account"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Location for the storage account"
  type        = string
  default     = "East US"
}

variable "storage_account_sku" {
  description = "SKU of the storage account"
  type        = string
  default     = "Standard_LRS"
}

resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_storage_account" "example" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = var.storage_account_sku

  tags = {
    environment = "Terraform"
  }
}