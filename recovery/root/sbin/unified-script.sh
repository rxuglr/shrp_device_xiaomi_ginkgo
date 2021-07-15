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

case $project in
    "willow")
        load_willow
        ;;
    "ginkgo")
        load_ginkgo
        ;;
esac

exit 0
