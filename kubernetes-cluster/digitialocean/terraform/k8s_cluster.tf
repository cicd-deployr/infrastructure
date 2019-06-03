resource "digitalocean_kubernetes_cluster" "deployr" {
  name    = "deployr"
  region  = "sfo2"
  version = "1.14.2-do.0"

  node_pool {
    name       = "worker-pool"
    size       = "s-2vcpu-2gb"
    node_count = 3
    tags       = ["agents"]
  }
}

resource "digitalocean_kubernetes_node_pool" "ssd" {
  cluster_id = "${digitalocean_kubernetes_cluster.deployr.id}"

  name       = "ssd-pool"
  size       = "c-2"
  node_count = 2
  tags       = ["ssd"]
}