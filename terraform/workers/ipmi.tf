resource "null_resource" "ipmi_worker" {
    provisioner "local-exec" {
        command = <<EOT
          ipmitool -I lanplus -H ${var.worker_ipmi_host} -p ${var.worker_ipmi_port} -U ${var.worker_ipmi_user} -P ${var.worker_ipmi_pass} chassis bootdev pxe;
          ipmitool -I lanplus -H ${var.worker_ipmi_host} -p ${var.worker_ipmi_port} -U ${var.worker_ipmi_user} -P ${var.worker_ipmi_pass} power reset || ipmitool -I lanplus -H ${var.worker_ipmi_host} -p ${var.worker_ipmi_port} -U ${var.worker_ipmi_user} -P ${var.worker_ipmi_pass} power on;
EOT
    }
}

resource "null_resource" "ipmi_worker_cleanup" {
    provisioner "local-exec" {
        when = "destroy"
        command = <<EOT
          ipmitool -I lanplus -H ${var.worker_ipmi_host} -p ${var.worker_ipmi_port} -U ${var.worker_ipmi_user} -P ${var.worker_ipmi_pass} power off;
EOT
    }
}

