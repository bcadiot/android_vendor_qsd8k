# CDMA Permissions
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml 

$(call inherit-product, vendor/qsd8k/qsd8k-vendor.mk)
