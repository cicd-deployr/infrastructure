variable "do_token" {}

provider "digitalocean" {
  token   = "${var.do_token}"
  version = "~> 1.4"
}

/* 
#TODO: Need to switch to use the consul based backed once we have util server setup and configured to run consul cluster
terraform {
  backend "consul" {
    address = "localhost:8500"
    scheme  = "http"
    path    = "deployr/kubernetes"
  }
}
*/