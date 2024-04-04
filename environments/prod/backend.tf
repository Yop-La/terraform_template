terraform {
  backend "s3" {
    bucket         = "foodles-cloud-functoin-terraform-state"
    key            = "prod/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}
