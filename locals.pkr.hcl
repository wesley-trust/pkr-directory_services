# Calculate local variables
locals {

  # Resource functions and concatenations
  resource_group_name = "${var.service_name}-${var.service_environment}-${var.service_location_prefix}-${var.service_deployment}-rg"
}
