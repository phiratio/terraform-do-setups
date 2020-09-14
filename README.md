# README

Terraform config to create a load balancer with 2 nginx nodes with dns records.

Digital Ocean, Cloudflare and own domain are required

## How to run

```
git clone -b nginx_loadbalancer git@github.com:phiratio/terraform-do-cluster.git
export DO_PAT="<your_digital_ocean_token>"
export TF_LOG=1
terraform init
terraform plan \
  -var "do_token=${DO_PAT}" \
  -var "pvt_key=$HOME/.ssh/sshkey"
terraform apply \
  -var "do_token=${DO_PAT}" \
  -var "pvt_key=$HOME/.ssh/sshkey"
# check droplet stats
terraform show terraform.tfstate
# you can refresh state if changes outside of terraform were made
terraform refresh \
  -var "do_token=${DO_PAT}" \
  -var "pvt_key=$HOME/.ssh/sshkey"
# create second nginx instance
sed 's/www-1/www-2/g' www-1.tf > www-2.tf
# and load balancer, repeat plan and apply steps

# cname with cloudflare
export CF_TOKEN="<your cloudflare token>"
export CF_MAIL="<your cloudflare email>"
export CF_ZONE_ID="<your cf domain zone id>"
export CF_DOMAIN="<your cf domain zone id>"

terraform plan \
  -var "do_token=${DO_PAT}" \
  -var "pvt_key=$HOME/.ssh/sshkey" \
  -var "cf_token=$CF_TOKEN" \
  -var "cf_email=$CF_EMAIL" \
  -var "cf_domain=$CF_DOMAIN" \
  -var "cf_zone_id=$CF_ZONE_ID"
  
terraform apply \
  -var "do_token=${DO_PAT}" \
  -var "pvt_key=$HOME/.ssh/sshkey" \
  -var "cf_token=$CF_TOKEN" \
  -var "cf_email=$CF_EMAIL" \
  -var "cf_domain=$CF_DOMAIN" \
  -var "cf_zone_id=$CF_ZONE_ID"
  
terraform plan -destroy -out=terraform.tfplan \
  -var "do_token=${DO_PAT}" \
  -var "pvt_key=$HOME/.ssh/sshkey" \
  -var "cf_token=$CF_TOKEN" \
  -var "cf_email=$CF_EMAIL" \
  -var "cf_domain=$CF_DOMAIN" \
  -var "cf_zone_id=$CF_ZONE_ID"
  
terraform apply terraform.tfplan  

```
