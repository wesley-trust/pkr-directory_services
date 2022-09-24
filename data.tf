# Resources
data "azurerm_images" "search" {
  count               = var.provision_shared_vm_image == true ? 1 : 0
  resource_group_name = module.resource_group.name

  tags_filter = {
    name_prefix = var.resource_image
    version     = "latest"
    environment = var.service_environment
    deployment  = var.service_deployment
  }
}

data "azurerm_image" "select" {
  count = var.provision_shared_vm_image == true ? 1 : 0
  name  = data.azurerm_images.search[0].images[0].name

  resource_group_name = module.resource_group.name
}

data "azurerm_shared_image_gallery" "select" {
  count               = var.provision_shared_vm_image == true ? 1 : 0
  name                = var.resource_gallery_name
  resource_group_name = local.resource_gallery_group
}
