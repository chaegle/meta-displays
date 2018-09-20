# Insert a copyright statement here

FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"

SRC_URI_append_ccimx6ulsbc = "\
    ${@base_conditional('DISP_LQ043', '1', 'file://0001-ARM-dts-kernel-ccimx6ulsbc-Add-LQ043Y1DY01-LCD-suppo.patch' , '', d)} \
"

SRC_URI_append_ccimx6sbc = "\
    ${@base_conditional('DISP_FUSION', '1', 'file://0001-ARM-dts-ccimx6sbc-Enable-support-for-HSD101PFW01-LCD.patch', '', d)} \
    ${@base_conditional('DISP_FUSION_ADDR_14', '1', 'file://0002-ARM-dts-ccimx6sbc-Enable-fusion-touch-on-addr-14.patch', '', d)} \
    ${@base_conditional('DISP_FUSION_ADDR_10', '1', 'file://0002-ARM-dts-ccimx6sbc-Enable-fusion-touch-on-addr-10.patch', '', d)} \
"

SRC_URI_append_ccimx6qpsbc = "\
    ${@base_conditional('DISP_FUSION', '1', 'file://0001-ARM-dts-ccimx6qpsbc-Enable-support-for-HSD101PFW01-L.patch', '', d)} \
    ${@base_conditional('DISP_FUSION_ADDR_14', '1', 'file://0002-ARM-dts-ccimx6qpsbc-Enable-fusion-touch-on-addr-14.patch', '', d)} \
    ${@base_conditional('DISP_FUSION_ADDR_10', '1', 'file://0002-ARM-dts-ccimx6qpsbc-Enable-fusion-touch-on-addr-10.patch', '', d)} \
"

#
# Enable LQ043 kernel driver
#
lq043_kernel_preconfigure() {
        mkdir -p ${B}

        kernel_conf_variable FB_LQ043Y1DY01 y
}

do_configure_prepend() {
        
        if [ "${DISP_LQ043}" = "1" ]; then
               lq043_kernel_preconfigure
        fi
}

