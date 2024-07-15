LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE_TAGS := optional

LOCAL_SRC_FILES := \
	Exynos_OMX_Wmadec.c \
	library_register.c

LOCAL_PRELINK_MODULE := false
LOCAL_MODULE := libOMX.Exynos.WMA.Decoder
LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/omx
ifeq ($(BOARD_USES_VENDORIMAGE), true)
LOCAL_PROPRIETARY_MODULE := true
endif

LOCAL_CFLAGS :=

LOCAL_ARM_MODE := arm

LOCAL_STATIC_LIBRARIES := libExynosOMX_Adec libExynosOMX_OSAL libExynosOMX_ABasecomponent \
	libsrpapi
LOCAL_SHARED_LIBRARIES := libc libdl libcutils libutils libui \
	libExynosOMX_Resourcemanager libffmpegapi\

LOCAL_ADDITIONAL_DEPENDENCIES := \
	$(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr

LOCAL_C_INCLUDES := \
    $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/include \
	$(EXYNOS_OMX_INC)/exynos \
	$(EXYNOS_OMX_TOP)/osal \
	$(EXYNOS_OMX_TOP)/core \
	$(EXYNOS_OMX_COMPONENT)/common \
	$(EXYNOS_OMX_COMPONENT)/audio/dec \
	$(EXYNOS_AUDIO_CODEC)/alp/include \
	$(EXYNOS_AUDIO_CODEC)/ffmpeg/include

include $(BUILD_SHARED_LIBRARY)
