#resource "null_resource" "ipmi_bootstrap" {
#    provisioner "local-exec" {
#        command = <<EOT
#          ipmitool -I lanplus -H ${var.bootstrap_ipmi_host} -p ${var.bootstrap_ipmi_port} -U ${var.bootstrap_ipmi_user} -P ${var.bootstrap_ipmi_pass} chassis bootdev pxe;
#          ipmitool -I lanplus -H ${var.bootstrap_ipmi_host} -p ${var.bootstrap_ipmi_port} -U ${var.bootstrap_ipmi_user} -P ${var.bootstrap_ipmi_pass} power reset || ipmitool -I lanplus -H ${var.bootstrap_ipmi_host} -p ${var.bootstrap_ipmi_port} -U ${var.bootstrap_ipmi_user} -P ${var.bootstrap_ipmi_pass} power on;
#EOT
#    }
#}
#
#resource "null_resource" "ipmi_bootstrap_cleanup" {
#    provisioner "local-exec" {
#        when = "destroy"
#        command = <<EOT
#          ipmitool -I lanplus -H ${var.bootstrap_ipmi_host} -p ${var.bootstrap_ipmi_port} -U ${var.bootstrap_ipmi_user} -P ${var.bootstrap_ipmi_pass} power off;
#EOT
#    }
#}
