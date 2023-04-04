data "digitalocean_ssh_key" "ssh" {
  name = "${var.ssh_key_name}"
}

module "module_server" {
  source = "../modules/server"

  ssh_key_id = "${data.digitalocean_ssh_key.ssh.id}"
  project_name = "${var.project_name}"
  droplet_name = "${var.droplet_name}"
}

