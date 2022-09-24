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

variable "resource_publisher" {
  description = "Publisher for the provisioned resources"
  type        = string
  default     = "WindowsServer"
}

variable "resource_offer" {
  description = "Offer for the provisioned resources"
  type        = string
  default     = "2022-datacenter-azure-edition-smalldisk"
}

variable "resource_name" {
  description = "Desired name for the provisioned resources"
  type        = string
  default     = "DomainServices"
}

variable "resource_image" {
  description = "Desired image for the provisioned resources"
  type        = string
  default     = "windows_server_2022-domain_services"
}

variable "resource_platform" {
  description = "OS Platform for the provisioned resources"
  type        = string
  default     = "Windows"
}

variable "resource_gallery_name" {
  description = "Name of the shared image gallery to create the shared image"
  type        = string
  default     = "ImageGalleryServices"
}

variable "resource_storage_account_type" {
  description = "Storage type for the shared image"
  type        = string
  default     = "Standard_LRS"
}

variable "resource_replication_mode" {
  description = "Replication mode for the shared image"
  type        = string
  default     = "Shallow"
}

variable "provision_shared_vm_image" {
  description = "Whether to provision shared VM image"
  type        = bool
  default     = true
}