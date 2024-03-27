provider "azurerm" {
  features {}
  tenant_id = "0dce2fe3-47dd-44df-b0b7-a64fc7f09d88"
}
# create Terraform code for provisioning an Azure Web App
resource "azurerm_app_service" "webapp" {
    name                = "co-pilot-test-webapp"
    location            = "East US"
    resource_group_name = azurerm_resource_group.example.name
    app_service_plan_id = azurerm_app_service_plan.example.id

    site_config {
        dotnet_framework_version = "v4.0"
        scm_type                 = "LocalGit"
    }

    app_settings = {
        "KEY1" = "VALUE1"
        "KEY2" = "VALUE2"
    }
}

resource "azurerm_app_service_plan" "example" {
    name                = "co-pilot-test-webapp-service-plan"
    location            = "East US"
    resource_group_name = azurerm_resource_group.example.name
    kind                = "Windows"
    reserved            = true

    sku {
        tier = "Standard"
        size = "S1"
    }
}

resource "azurerm_resource_group" "example" {
    name     = "rg-co-pilot-test"
    location = "East US"
}


