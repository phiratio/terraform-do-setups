resource "cloudflare_record" "www" {
  name    = "www"
  value   = digitalocean_loadbalancer.www-lb.ip
  type    = "A"
  proxied = true
  zone_id = var.cf_zone_id
}

resource "cloudflare_record" "main" {
  name    = var.cf_domain
  value   = digitalocean_loadbalancer.www-lb.ip
  type    = "A"
  proxied = true
  zone_id = var.cf_zone_id
}