# Packer image source
source "azure-arm" "windows" {
  os_type         = "Windows"
  image_publisher = "MicrosoftWindowsServer"
  image_offer     = "WindowsServer"

  communicator   = "winrm"
  winrm_use_ssl  = "true"
  winrm_insecure = "true"
  winrm_timeout  = "3m"
  winrm_username = "packer"

  location = var.service_location
  vm_size  = var.service_vm_size

  use_azure_cli_auth = true
}