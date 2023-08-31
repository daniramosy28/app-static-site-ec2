terraform {
      backend "s3" {
    bucket         = "tf-notifier-state-1CPIaC"
    key            = "path/to/terraform.tfstate"
    dynamodb_table = "tf-notifier-state-1CPIaC"
    region         = "us-east-1"
    profile        = "fiap"
  }
}