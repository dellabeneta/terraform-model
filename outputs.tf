
output "droplet_public_ips" {
  description = "IPs públicos dos Droplets"
  value = {
    for idx, droplet in digitalocean_droplet.droplet : 
    "${var.environment}-droplet-${idx + 1}" => droplet.ipv4_address
  }
}

output "vpc_id" {
  description = "ID da VPC"
  value       = digitalocean_vpc.vpc.id
}