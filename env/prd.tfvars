region       = "sfo2"
droplet_size = "s-4vcpu-8gb"
environment  = "prd"

vpc_name      = "vpc-prd"
ip_range      = "10.0.0.0/24"
droplet_name  = "droplet-prd"
droplet_count = 4

tags = [
  "environment:prd",
  "managed-by:terraform"
]
