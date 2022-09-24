# Resources
resource "azurerm_shared_image" "definition" {
  count               = var.provision_shared_vm_image == true ? 1 : 0
  name                = var.resource_name
  gallery_name        = data.azurerm_shared_image_gallery.select[0].name
  resource_group_name = data.azurerm_shared_image_gallery.select[0].resource_group_name
  location            = data.azurerm_shared_image_gallery.select[0].location
  os_type             = var.resource_platform
  hyper_v_generation  = "V2"

  identifier {
    publisher = var.resource_publisher
    offer     = var.resource_offer
    sku       = var.resource_name
  }
}

resource "azurerm_shared_image_version" "image" {
  count               = var.provision_shared_vm_image == true ? 1 : 0
  name                = "1.0.0"
  gallery_name        = azurerm_shared_image.definition[0].gallery_name
  image_name          = azurerm_shared_image.definition[0].name
  resource_group_name = azurerm_shared_image.definition[0].resource_group_name
  location            = azurerm_shared_image.definition[0].location
  managed_image_id    = data.azurerm_image.select[0].id

  target_region {
    name                   = azurerm_shared_image.definition[0].location
    regional_replica_count = 1
    storage_account_type   = var.resource_storage_account_type
  }

  replication_mode = var.resource_replication_mode
}
