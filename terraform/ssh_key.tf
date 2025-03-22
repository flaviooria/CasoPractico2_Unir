# Define the SSH key pair resource
resource "tls_private_key" "ssh_key" {
  algorithm = "RSA" # Specify the key algorithm (RSA, ECDSA, etc.)
  rsa_bits  = 2048  # Specify the key size (bits) for RSA keys
}