# Resources
data "azurerm_images" "search" {
  resource_group_name = module.resource_group.name

  tags_filter = {
    name_prefix = var.resource_image
    version     = "latest"
    environment = var.service_environment
    deployment  = var.service_deployment
  }
}

data "azurerm_image" "select" {

  name = data.azurerm_images.search.images[0].name

  resource_group_name = module.resource_group.name
}

data "azurerm_shared_image_gallery" "select" {
  name                = var.resource_gallery_name
  resource_group_name = local.resource_gallery_group
}