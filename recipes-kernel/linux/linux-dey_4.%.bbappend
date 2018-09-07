FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"

SRC_URI += "file://0001-ARM-dts-kernel-Add-support-for-LQ043Y1DY01-display.patch"

#
# Enable LQ043 kernel driver
#
lq043_kernel_preconfigure() {
        mkdir -p ${B}

        kernel_conf_variable FB_LQ043Y1DY01 y
}

do_configure_prepend() {

        lq043_kernel_preconfigure
}

