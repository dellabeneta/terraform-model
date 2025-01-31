
resource "digitalocean_ssh_key" "ssh-key" {
  name       = "ssh-key"
  public_key = var.ssh_key
}
