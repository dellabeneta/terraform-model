
region       = "nyc1"
droplet_size = "s-2vcpu-2gb"
environment  = "dev"

vpc_name      = "vpc-dev"
ip_range      = "10.0.0.0/24"
droplet_name  = "droplet-dev"
droplet_count = 1

tags = [
  "environment:dev",
  "managed-by:terraform"
]
