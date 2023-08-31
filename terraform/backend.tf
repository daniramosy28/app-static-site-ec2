terraform {
      backend "s3" {
    bucket         = "tf-notifier-state-check"
    key            = "path/to/terraform.tfstate"
    dynamodb_table = "tf-notifier-state-check"
    region         = "us-east-1"
    profile        = "fiap"
  }
}