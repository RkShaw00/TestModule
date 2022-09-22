provider "azurerm" {
  features{
    
  }
}

data "azurerm_resource_group" "example" {
  name="PepsiCo-CTO-EDAP-rg"
}

resource "azurerm_app_service_plan" "example" {
  name                = "api-appserviceplan-pro"
  location            = data.azurerm_resource_group.example.location
  resource_group_name = data.azurerm_resource_group.example.name

  sku {
    tier = "Standard"
    size = "S1"
  }
}


resource "azurerm_app_service" "example" {
  name                = "example-app-service"
  location            = data.azurerm_resource_group.example.location
  resource_group_name = data.azurerm_resource_group.example.name
  app_service_plan_id = azurerm_app_service_plan.example.id

}