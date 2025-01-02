terraform {
  backend "azurerm" {
    resource_group_name   = "CG-tracks"
    storage_account_name  = "backendtfplatformtrack"
    container_name        = "terraform-state"
    key                    = "terraform.tfstate"
  }
}
