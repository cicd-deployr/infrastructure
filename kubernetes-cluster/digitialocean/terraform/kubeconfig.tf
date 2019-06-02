resource "local_file" "foo" {
    content     = "${digitalocean_kubernetes_cluster.deployr.kube_config.0.raw_config}"
    filename = "${path.module}/kubeconfig.yaml"
}