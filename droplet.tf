
resource "digitalocean_droplet" "droplet" {
  count    = var.droplet_count
  name     = "${var.droplet_name}-${count.index + 1}"
  image    = var.droplet_image
  region   = var.region
  size     = var.droplet_size
  vpc_uuid = digitalocean_vpc.vpc.id
  ssh_keys = [digitalocean_ssh_key.ssh-key.id]
  tags     = var.tags
}