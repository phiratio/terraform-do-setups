terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "1.22.2"
    }
    cloudflare = {
      source = "cloudflare/cloudflare"
      version = "2.11.0"
    }
  }
}
variable "do_token" {}
variable "pvt_key" {}

variable "cf_token" {}
variable "cf_email" {}
variable "cf_domain" {}
variable "cf_zone_id" {}

provider "digitalocean" {
  token = var.do_token
}
#how you named your ssh key when added
data "digitalocean_ssh_key" "botdd" {
  name = "botdd"
}

provider cloudflare {
  email = var.cf_email
  api_key = var.cf_token
}

