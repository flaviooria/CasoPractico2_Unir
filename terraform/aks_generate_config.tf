resource "local_file" "aks_kubeconfig" {

  depends_on = [azurerm_kubernetes_cluster.aks_cp2]

  filename = "${path.root}/../ansible/kubeconfig"
  content  = azurerm_kubernetes_cluster.aks_cp2.kube_config_raw
}