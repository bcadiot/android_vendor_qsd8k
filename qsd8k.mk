DEVICE_PACKAGE_OVERLAYS := vendor/qsd8k/overlay

PRODUCT_PROPERTY_OVERRIDES += \
	media.a1026.nsForVoiceRec=0 \
	media.a1026.enableA1026=1 \
	ro.media.dec.jpeg.memcap=20000000 \
	ro.opengles.version=131072 

# Enable gpu composition: 0 => cpu composition, 1 => gpu composition
# Note: must be 1 for debug.composition.type to work
PRODUCT_PROPERTY_OVERRIDES += \
	debug.sf.hw=1 

# Enable copybit composition
PRODUCT_PROPERTY_OVERRIDES += \
	debug.composition.type=mdp 

# Dalvik properties - read from AndroidRuntime
# dalvik.vm.dexopt-flags=v=n,o=v,m=y 
PRODUCT_PROPERTY_OVERRIDES += \
	dalvik.vm.dexopt-flags=m=y \
	dalvik.vm.checkjni=false \
	dalvik.vm.heapsize=128m \
	dalvik.vm.heapgrowthlimit=48m \
	dalvik.vm.heapstartsize=5m 

# Force 2 buffers - gralloc defaults to 3 and we only have 2
PRODUCT_PROPERTY_OVERRIDES += \
	debug.gr.numframebuffers=2 

# Reduce wifi scan. Better batery life
PRODUCT_PROPERTY_OVERRIDES += \
	ro.ril.disable.power.collapse=0 \
	wifi.supplicant_scan_interval=180 

# Improve touch responseiveness
PRODUCT_PROPERTY_OVERRIDES += \
	Debug.performance.tuning=1 \
	Video.accelerate.hw=1 

# Force launcher/apps into memory
PRODUCT_PROPERTY_OVERRIDES += \
	ro.HOME_APP_ADJ=1 \
	ro.PERCEPTIBLE_APP_ADJ=0 

# Fix some application issues
PRODUCT_PROPERTY_OVERRIDES += \
	ro.kernel.android.checkjni=0 \
	dalvik.vm.checkjni=0 

# Fix black screen after call
PRODUCT_PROPERTY_OVERRIDES += \
	ro.lge.proximity.delay=10 \
	mot.proximity.delay=10 

# Enhance scroll responsiveness
PRODUCT_PROPERTY_OVERRIDES += \
	windowsmgr.max_events_per_sec=120 

# Don't set /proc/sys/vm/dirty_ratio to 0 when USB mounting
PRODUCT_PROPERTY_OVERRIDES += \
	ro.vold.umsdirtyratio=20 

# Ril workaround
PRODUCT_PROPERTY_OVERRIDES += \
	ro.telephony.ril.v3=signalstrength 

# HardwareRenderer properties
# dirty_regions: "false" to disable partial invalidates, override if enabletr=true
PRODUCT_PROPERTY_OVERRIDES += \
	hwui.render_dirty_regions=false \
	hwui.disable_vsync=true \
	hwui.print_config=choice \
	debug.enabletr=false 

# Set usb type
PRODUCT_PROPERTY_OVERRIDES += \
	persist.sys.usb.config=mass_storage \
	persist.service.adb.enable=1

# Sensors
PRODUCT_PACKAGES := \
	camera.qsd8k 

# Audio
PRODUCT_PACKAGES := \
	audio.a2dp.default \
	audio.primary.qsd8k \
	audio_policy.qsd8k \
	libaudioutils 

# GPU
PRODUCT_PACKAGES := \
	copybit.qsd8k \
	gralloc.qsd8k \
	hwcomposer.default \
	hwcomposer.qsd8k \
	libgenlock \
	libmemalloc \
	libtilerenderer \
	libQcomUI 

# Omx
PRODUCT_PACKAGES := \
	libOmxCore \
	libOmxVidEnc \
	libOmxVdec \
	libstagefrighthw 

# Omx cli test apps
PRODUCT_PACKAGES := \
	libmm-omxcore \
	mm-vdec-omx-test \
	liblasic \
	ast-mm-vdec-omx-test \
	mm-venc-omx-test

# Propriatary libs
PRODUCT_COPY_FILES += \
	vendor/qsd8k/lib/libcamera.so:system/lib/libcamera.so \
	vendor/qsd8k/lib/liboemcamera.so:system/lib/liboemcamera.so \
	vendor/qsd8k/lib/egl/eglsubAndroid.so:system/lib/egl/eglsubAndroid.so \
	vendor/qsd8k/lib/egl/libEGL_adreno200.so:system/lib/egl/libEGL_adreno200.so \
	vendor/qsd8k/lib/egl/libGLESv1_CM_adreno200.so:system/lib/egl/libGLESv1_CM_adreno200.so \
	vendor/qsd8k/lib/egl/libGLESv2_adreno200.so:system/lib/egl/libGLESv2_adreno200.so \
	vendor/qsd8k/lib/egl/libq3dtools_adreno200.so:system/lib/egl/libq3dtools_adreno200.so

# Permissions
PRODUCT_COPY_FILES += \
	frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
	frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
	frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
	frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# Disable strict mode
ADDITIONAL_DEFAULT_PROPERTIES += persist.sys.strictmode.disable=true
