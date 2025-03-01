resource "local_file" "ssh_key_file" {
  filename        = "${path.root}/../.ssh/id_rsa_az_vm"
  content         = tls_private_key.ssh_key.private_key_pem
  file_permission = "0600"
}