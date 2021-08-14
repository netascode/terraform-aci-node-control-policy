terraform {
  required_providers {
    test = {
      source = "terraform.io/builtin/test"
    }

    aci = {
      source  = "netascode/aci"
      version = ">=0.2.0"
    }
  }
}

module "main" {
  source = "../.."

  name = "NC1"
}

data "aci_rest" "fabricNodeControl" {
  dn = "uni/fabric/nodecontrol-${module.main.name}"

  depends_on = [module.main]
}

resource "test_assertions" "fabricNodeControl" {
  component = "fabricNodeControl"

  equal "name" {
    description = "name"
    got         = data.aci_rest.fabricNodeControl.content.name
    want        = module.main.name
  }
}
