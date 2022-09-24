# Resources
resource "azurerm_shared_image" "definition" {
  name                = var.resource_name
  gallery_name        = data.azurerm_shared_image_gallery.select.name
  resource_group_name = data.azurerm_shared_image_gallery.select.resource_group_name
  location            = data.azurerm_shared_image_gallery.select.location
  os_type             = var.resource_platform

  identifier {
    publisher = var.resource_publisher
    offer     = var.resource_offer
    sku       = var.resource_name
  }
}

resource "azurerm_shared_image_version" "image" {
  name                = "1.0.0"
  gallery_name        = azurerm_shared_image.definition.gallery_name
  image_name          = azurerm_shared_image.definition.name
  resource_group_name = azurerm_shared_image.definition.resource_group_name
  location            = azurerm_shared_image.definition.location
  managed_image_id    = data.azurerm_image.select.id

  target_region {
    name                   = azurerm_shared_image.definition.location
    regional_replica_count = 1
    storage_account_type   = var.resource_storage_account_type
  }

  replication_mode = var.resource_replication_mode
}
