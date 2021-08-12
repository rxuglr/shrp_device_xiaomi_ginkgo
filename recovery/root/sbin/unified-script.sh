#!/system/bin/sh
# This script is needed to automatically set device props.
load_willow()
{
    resetprop "ro.product.model" "Redmi Note 8T"
    resetprop "ro.product.name" "willow"
    resetprop "ro.build.product" "willow"
    resetprop "ro.product.device" "willow"
    resetprop "ro.vendor.product.device" "willow"
}
load_ginkgo()
{
    resetprop "ro.product.model" "Redmi Note 8"
    resetprop "ro.product.name" "ginkgo"
    resetprop "ro.build.product" "ginkgo"
    resetprop "ro.product.device" "ginkgo"
    resetprop "ro.vendor.product.device" "ginkgo"
}

project=$(getprop ro.boot.product.hardware.sku)
echo $project
region=$(getprop ro.boot.hwc)
echo $region
hwversion=$(getprop ro.boot.hwversion)
echo $hwversion

case $project in
    "willow")
        load_willow
case $region in
    "Global_B")
        case $hwversion in
            "18.31.0"|"18.39.0"|"19.39.0")
                 load_willow
                 ;;
            "*")
                 load_ginkgo
                 ;;
        esac            
        ;;
    "ginkgo")
    "*")
        load_ginkgo
        ;;
esac
exit 0
