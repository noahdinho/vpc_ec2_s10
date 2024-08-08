
terraform {
  backend "s3" {
    bucket  = "w7-sl-terraform"
    key     = "session10/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
    //dynamodb_table = "locktable"
  }
}

