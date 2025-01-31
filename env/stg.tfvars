region       = "nyc3"
droplet_size = "s-2vcpu-2gb"
environment  = "stg"

vpc_name      = "vpc-stg"
ip_range      = "10.0.0.0/24"
droplet_name  = "droplet-stg"
droplet_count = 2

tags = [
  "environment:stg",
  "managed-by:terraform"
]
