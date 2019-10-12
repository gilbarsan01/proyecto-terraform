terraform {
  backend "s3" {
    bucket = "test-bk-1234"
    key    = "terraform/state/web_interface.tfstate"
    region = "us-west-2"
  }
}
