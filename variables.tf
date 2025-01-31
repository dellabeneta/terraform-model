variable "do_token" {
  description = "DigitalOcean API token"
  type        = string
  sensitive   = true
}

variable "ssh_key" {
  description = "Chave publica SSH"
  type        = string
}

variable "region" {
  description = "Região da DigitalOcean"
  type        = string
}

variable "droplet_size" {
  description = "Tamanho do Droplet"
  type        = string
}

variable "droplet_image" {
  description = "Imagem do Droplet"
  type        = string
  default     = "ubuntu-24-04-x64"
}

variable "environment" {
  description = "Ambiente (dev, stg, prd)"
  type        = string
}

variable "vpc_name" {
  description = "Nome da VPC"
  type        = string
}

variable "ip_range" {
  description = "IP Range da VPC"
  type        = string
}

variable "droplet_name" {
  description = "Nome do Droplet"
  type        = string
}

variable "droplet_count" {
  description = "Quantidade de Droplets para o ambiente"
  type        = number
}

variable "tags" {
  description = "Tags para recursos"
  type        = list(string)
  default     = []
}