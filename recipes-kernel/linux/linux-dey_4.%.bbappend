

FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"

SRC_URI_append_ccimx6ulsbc = "\
    ${@base_conditional('DISP_ADD_LQ043', '1', 'file://0001-ARM-dts-kernel-ccimx6ulsbc-Add-LQ043Y1DY01-LCD-suppo.patch' , '', d)} \
"


#
# Enable LQ043 kernel driver
#
lq043_kernel_preconfigure() {
        mkdir -p ${B}

        kernel_conf_variable FB_LQ043Y1DY01 y
}

do_configure_prepend() {
        
        if [ "${DISP_ADD_LQ043}" = "1" ]; then
               lq043_kernel_preconfigure
        fi
}

