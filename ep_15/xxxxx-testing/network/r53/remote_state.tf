terraform {
  backend "s3" {
    bucket = "terraform-proyecto-ep-15"
    key    = "testing/r53/state.tfstate"
    region = "us-west-2"
  }
}


data "terraform_remote_state" "common" {
  backend = "s3"
  config {
    bucket = "terraform-proyecto-ep-15"
    key    = "testing/common-vars/state.tfstate"
    region = "us-west-2"
  }
}


data "terraform_remote_state" "vpc" {
  backend = "s3"
  config {
    bucket = "terraform-proyecto-ep-15"
    key    = "testing/vpc/state.tfstate"
    region = "us-west-2"
  }
}

