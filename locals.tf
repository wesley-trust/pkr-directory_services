# Calculate local variables
locals {

  # Service functions and concatenations
  service_location_prefix = replace(var.service_location, "/[a-z[:space:]]/", "")

  # Resource functions and concatenations
  resource_gallery_group = "${var.resource_gallery_name}-${var.service_environment}-${local.service_location_prefix}-${var.service_deployment}-rg"
}
