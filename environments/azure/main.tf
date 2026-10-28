terraform {
  required_version = ">= 1.6.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

module "azure_infrastructure" {
  source        = "git::https://github.com/cliffbill/terraform-modules.git//azure/network?ref=v2.2.3"
  location      = "westus2"
  admin_ssh_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCey1hQ8nQrQOGH3vgVT+9UWRWHhuOQGOSvLpzqHTaUKlfhVMQ4qXnHOxRbz5zZYW963E1i9g19nzhDCsBXTF5vWXEnYYWh6HnamKvFfPfKVLXY3dOzSM3Sz8mURMf5TVPkA9dbWKEmqbaLr4Zxqd+Zx+KDg4LKsFJ90VkbS/HUP/s4ng09TSjirTG3z9IIb/dPnVRihyMMyQ7U/oIEYPBJH6WxNAxZF2xXFLDqTbX82pFcTfn7u3I1rB8ocngbIPY4knhiPtoeENx49p3CL2MMXO0SWZmj8X3BKMPIPwZoI40VRA4uFqVNbl6MTeL7Gi7NLyLaCW6Slx91kHj/+rZT billc@am-zelaya-OCS2"
}
