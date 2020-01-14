resource "null_resource" "ipmi_worker" {
    count = var.worker_count
    provisioner "local-exec" {
        command = <<EOT
          ipmitool -I lanplus -H ${var.worker_nodes[count.index]["worker_ipmi_host"]} -p ${var.worker_nodes[count.index]["worker_ipmi_port"]} -U ${var.worker_nodes[count.index]["worker_ipmi_user"]} -P ${var.worker_nodes[count.index]["worker_ipmi_pass"]} chassis bootdev pxe;
          ipmitool -I lanplus -H ${var.worker_nodes[count.index]["worker_ipmi_host"]} -p ${var.worker_nodes[count.index]["worker_ipmi_port"]} -U ${var.worker_nodes[count.index]["worker_ipmi_user"]} -P ${var.worker_nodes[count.index]["worker_ipmi_pass"]} power cycle || ipmitool -I lanplus -H ${var.worker_nodes[count.index]["worker_ipmi_host"]} -p ${var.worker_nodes[count.index]["worker_ipmi_port"]} -U ${var.worker_nodes[count.index]["worker_ipmi_user"]} -P ${var.worker_nodes[count.index]["worker_ipmi_pass"]} power on;
EOT
    }
}

resource "null_resource" "ipmi_worker_cleanup" {
    count = var.worker_count
    provisioner "local-exec" {
        when = "destroy"
        command = <<EOT
          ipmitool -I lanplus -H ${var.worker_nodes[count.index]["worker_ipmi_host"]} -p ${var.worker_nodes[count.index]["worker_ipmi_port"]} -U ${var.worker_nodes[count.index]["worker_ipmi_user"]} -P ${var.worker_nodes[count.index]["worker_ipmi_pass"]} power off;
EOT
    }
}
