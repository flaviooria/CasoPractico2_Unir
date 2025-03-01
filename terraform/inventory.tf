resource "local_file" "create_inventory" {

  depends_on = [ tls_private_key.ssh_key, local_file.ssh_key_file ]

  filename = "${path.root}/../ansible/inventory.ini"
  content = templatefile("${path.root}/templates/inventory.tftpl", {
    vm_name = "vm"
    vm_ip = "127.0.0.1"
  })
}