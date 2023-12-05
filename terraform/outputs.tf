output "honeypot_ip" {
  description = "Honeypot Public IP"
  value       = data.azurerm_public_ip.honeypot[*].ip_address
}

output "connecting_via_ssh" {
  description = "Connecting via ssh"
  value = [
    for ip in data.azurerm_public_ip.honeypot[*].ip_address :
    join("",
      [
        "ssh ",
        "-i ",
        var.azure_ssh_key_priv,
        " ",
        "-p ",
        var.honeypot_ssh_port,
        " ",
        var.azure_image_user,
        "@",
        ip,
    ])
  ]
}
