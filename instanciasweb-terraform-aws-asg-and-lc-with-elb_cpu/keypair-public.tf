#Se declara el keypair para la conexión a la instancia.

resource "aws_key_pair" "keypair" {
  key_name   = "${var.project_name}-keypair"

  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDyy3ZmliPL87q47i9/Gjp1QXYt6NaeumfZOG5N0yKm7vmLM1rfR6V5c6vGX16kpf6bk7DgD6BY4yoMitJuMI3caLtG9ETH1RtLxpr9hsq8GtmcVihBVc6mMScC+e0eSC0544ZT/fCnRc9zGoYQV1qyhwoiljStBX4EziAc2k1POHVe7hGQZocCeA8nqdy3QJb6R7qcEMwLgyWvCPJV3pHNHP61OTOu0I6jiHII1buhFNcbzCJzWN5CHknF+QtoDIONmlIFvKQVKDLX5IhUX6Q3F+HnosrLpS6laRaKcMqgkqB3C+jdeJpobkVCwZfrVcXp3lSlhaUK2bLGABardtwv gilbarsan@HP-Pavilion-17-Notebook"
}

