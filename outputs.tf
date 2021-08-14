output "dn" {
  value       = aci_rest.fabricNodeControl.id
  description = "Distinguished name of `fabricNodeControl` object."
}

output "name" {
  value       = aci_rest.fabricNodeControl.content.name
  description = "Node control policy name."
}
