# create Terraform code for provisioning an Azure Web App
resource "azurerm_app_service" "webapp" {
    name                = "my-webapp"
    location            = "West US"
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
    name                = "my-app-service-plan"
    location            = "West US"
    resource_group_name = azurerm_resource_group.example.name
    kind                = "Windows"
    reserved            = true

    sku {
        tier = "Standard"
        size = "S1"
    }
}

resource "azurerm_resource_group" "example" {
    name     = "my-resource-group"
    location = "West US"
}