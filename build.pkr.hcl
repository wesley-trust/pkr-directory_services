# Packer builds
build {

  source "source.azure-arm.windows" {
    image_sku          = var.image_sku
    managed_image_name = var.managed_image_name

    managed_image_resource_group_name = local.resource_group_name

    virtual_network_name = var.virtual_network_name

    azure_tag {
      name  = "deployment"
      value = var.service_deployment
    }

    azure_tag {
      name  = "environment"
      value = var.service_environment
    }

    azure_tag {
      name  = "name_prefix"
      value = var.managed_image_name
    }

    azure_tag {
      name  = "version"
      value = "latest"
    }
  }

  # Build specific provisioner
  provisioner "powershell" {
    inline = [
      "$features = @('AD-Domain-Services', 'DNS')",
      "foreach ($feature in $features){Install-WindowsFeature -Name $feature}",
    ]
  }

  # Standard Windows Sysprep Provisioner
  provisioner "powershell" {
    inline = [
      "while ((Get-Service RdAgent).Status -ne 'Running') { Start-Sleep -s 5 }",
      "while ((Get-Service WindowsAzureGuestAgent).Status -ne 'Running') { Start-Sleep -s 5 }",
      "& $env:SystemRoot\\System32\\Sysprep\\Sysprep.exe /oobe /generalize /quiet /quit",
      "while($true) { $imageState = Get-ItemProperty HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Setup\\State | Select ImageState; if($imageState.ImageState -ne 'IMAGE_STATE_GENERALIZE_RESEAL_TO_OOBE') { Write-Output $imageState.ImageState; Start-Sleep -s 10  } else { break } }",
    ]
  }
}