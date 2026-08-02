terraform {
    required_providers {
        source = "hashicorp/azurerm"
        version = ">=4.80.0"
    }
}

provider "azurerm" {
    features {}
}