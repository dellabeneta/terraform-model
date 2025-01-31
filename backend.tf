
terraform {
  backend "s3" {
    bucket         = "terraformstates.dellabeneta.tech"
    key            = "terraform.tfstate"
    region         = "sa-east-1"
    encrypt        = true
    dynamodb_table = "terraform-model-lock"
  }
}
