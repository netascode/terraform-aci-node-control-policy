module "aci_node_control_policy" {
  source = "netascode/node-control-policy/aci"

  name      = "NC1"
  dom       = true
  telemetry = "netflow"
}
