
variable "env_conf" {
  type = map(string)
}

variable "cidr_block_public" {
  type = list(string)
}

variable "authorized_ips" {
  type = list(string)
}
