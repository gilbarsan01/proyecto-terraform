project_name = "vcc-api"
environment = "testing"

vpc_cidr_block = "192.168.0.0/16"

region = "us-west-2"
vpc_azs = ["us-west-2a", "us-west-2b", "us-west-2c"]

vpc_public_subnet_cidrs = [
	"192.168.10.0/24",
	"192.168.20.0/24",
	"192.168.30.0/24",
]

vpc_private_subnet_cidrs = [
	"192.168.11.0/24",
	"192.168.21.0/24",
	"192.168.31.0/24",
]


