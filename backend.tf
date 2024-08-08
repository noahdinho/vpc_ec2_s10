
terraform {
  backend "s3" {
    bucket  = "perso"
    key     = "session10/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
    //dynamodb_table = "perso1"
  }
}

