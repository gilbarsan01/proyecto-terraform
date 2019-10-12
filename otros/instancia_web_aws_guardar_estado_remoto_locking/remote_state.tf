terraform {
  backend "s3" {
    bucket = "test-bk-1234"
    key    = "terraform/state/web_interface.tfstate"
    dynamodb_table = "TerraformLock"    
    region = "us-west-2"
  }
}
