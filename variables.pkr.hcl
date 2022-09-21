# Define variables
variable "service_name" {
  description = "Desired name for the provisioned resources"
  type        = string
  default     = "Image-domain_services"
}

variable "service_environment" {
  description = "Desired environment for the service collection of provisioned resources"
  type        = string
  default     = "Prod"
}

variable "service_deployment" {
  description = "Desired deployment identifier of the service collection of provisioned resources"
  type        = string
  default     = "01"
}

variable "service_location" {
  description = "Desired location for each service environment"
  type        = string
  default     = "UK South"
}

# The RegEx used within Terraform in the Locals to get the location prefix, didn't work with Packer
variable "service_location_prefix" {
  description = "Desired location for each service environment"
  type        = string
  default     = "UKS"
}

variable "service_vm_size" {
  description = "Desired size for the service image capture"
  type        = string
  default     = "Standard_D2as_v4"
}

variable "virtual_network_name" {
  description = "The vNet to use as a private connection, if the network name is not unique, a resource group should be specified, if there is more than one subnet, a subnet should be specified"
  type        = string
  default     = "AgentServices-Lin-Prod-UKS-vnet"
}

variable "managed_image_name" {
  description = "The name of the image to be created"
  type        = string
  default     = "windows_server_2022-domain_services"
}

variable "image_sku" {
  description = "The base image to create from"
  type        = string
  default     = "2022-datacenter-azure-edition-smalldisk"
}
