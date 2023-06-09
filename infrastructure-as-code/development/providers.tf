provider "digitalocean" {
  token = "${var.do_token}"
}

terraform {
  required_version = "1.3.7"

  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

