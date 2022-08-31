# Define variables
variable "service_name" {
  description = "Desired name for the provisioned resources"
  type        = string
  default     = "ImageServices-domain_services"
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