# ================COMMON=====================

variable "cluster_id" {
  type = "string"
}

variable "cluster_domain" {
  type = "string"
}


# ================MATCHBOX=====================

variable "matchbox_rpc_endpoint" {
  type = "string"
}

variable "matchbox_http_endpoint" {
  type = "string"
}

variable "matchbox_trusted_ca_cert" {
  type    = "string"
  default = "matchbox/tls/ca.crt"
}

variable "matchbox_client_cert" {
  type    = "string"
  default = "matchbox/tls/client.crt"
}

variable "matchbox_client_key" {
  type    = "string"
  default = "matchbox/tls/client.key"
}

variable "worker_public_ipv4" {
  type = "string"
}

variable "worker_mac_address" {
  type = "string"
}

variable "pxe_os_image_url" {
  type = "string"
}

variable "pxe_kernel_url" {
  type = "string"
}

variable "pxe_initrd_url" {
  type = "string"
}

variable "worker_ign_file" {
  type = "string"
}

variable "worker_ipmi_host" {
  type = "string"
}

variable "worker_ipmi_port" {
  type = "string"
}

variable "worker_ipmi_user" {
  type = "string"
}

variable "worker_ipmi_pass" {
  type = "string"
}

variable "worker_count" {
  type    = "string"
  default = "1"
}
