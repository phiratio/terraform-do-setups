terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "1.22.2"
    }
  }
}
variable "do_token" {}
variable "pvt_key" {}
provider "digitalocean" {
  token = var.do_token
}
#how you named your ssh key when added
data "digitalocean_ssh_key" "botdd" {
  name = "botdd"
}
