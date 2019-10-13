#Se declara el keypair para la conexion a la instancia.

resource "aws_key_pair" "keypair" {
  key_name   = "${var.project_name}-keypair"

  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDYfpZnDbr7EuqhGMR4OMtgfzykKw/43IMmp+3rGiTNePthUmavcapqtJbuNsrh8MysdpxWE+ru16zTX4PVxIVrp5mMSaHMp1HNitPuluOrBsRrG9EA9tlANlGVsGJjGzq8Kd3kDa7HvFPDXP3hztGjawD3dVY+UOZmRJc5WXWs1oRl3JggNQwpaQKC6JcCW2a2UUBhQo+lsp3w1/5otA+QQkRQZTXe5RdRcViyMLnN4Fn7O7HZKHwhXtV3Oi0xr3t9BlF6NkH4DlvmcjGI5YzqZxWnfsfpBkugWZc/1exx0Su4nYO2VIg+8wn4hjPKRTQmvgRnvRbBj9QzIv6W8WgJ gilbarsan@gilbarsan-VirtualBox"
}

