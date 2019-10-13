terraform {
  backend "s3" {
    bucket = "terraform-proyecto-ep-15"
    key    = "testing/common-vars/state.tfstate"
    region = "us-west-2"
  }
}

