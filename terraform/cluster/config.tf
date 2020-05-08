# ================COMMON=====================

variable "cluster_id" {
  type = string
}

variable "cluster_domain" {
  type = string
}

variable "pxe_os_image_url" {
  type = string
}

variable "pxe_kernel_url" {
  type = string
}

variable "pxe_initrd_url" {
  type = string
}

# ================MATCHBOX=====================

variable "matchbox_rpc_endpoint" {
  type = string

}

variable "matchbox_http_endpoint" {
  type = string
}

variable "matchbox_trusted_ca_cert" {
  type    = string
  default = "matchbox/tls/ca.crt"
}

variable "matchbox_client_cert" {
  type    = string
  default = "matchbox/tls/client.crt"
}

variable "matchbox_client_key" {
  type    = string
  default = "matchbox/tls/client.key"
}

# ================BOOTSTRAP==================

variable "bootstrap_ign_file" {
  type = string
}

variable "bootstrap_public_ipv4" {
  type = string
}

variable "bootstrap_mac_address" {
  type = string
}

variable "bootstrap_ipmi_host" {
  type = string
}

variable "bootstrap_ipmi_port" {
  type = string
}

variable "bootstrap_ipmi_user" {
  type = string
}

variable "bootstrap_ipmi_pass" {
  type = string
}

# ================MASTER=====================

variable "master_count" {
  type    = string
  default = "1"
}

variable "master_nodes" {
  type = list(map(string))
}
