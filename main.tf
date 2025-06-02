terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  subscription_id = var.subscription_id
  features {}
}

variable "name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region where the resource group should be created"
  type        = string
}

variable "subscription_id" {
  description = "Azure Subscription Id"
  type = string
}

variable "tags" {
  description = "A map of tags to assign to the resource group"
  type        = map(string)
  default     = {}
}

resource "azurerm_resource_group" "this" {
  name     = var.name
  location = var.location
  tags     = var.tags
}

output "resource_group_name" {
  description = "The name of the resource group"
  value       = azurerm_resource_group.this.name
}

output "resource_group_location" {
  description = "The Azure location of the resource group"
  value       = azurerm_resource_group.this.location
}

output "resource_group_id" {
  description = "The ID of the resource group"
  value       = azurerm_resource_group.this.id
}
