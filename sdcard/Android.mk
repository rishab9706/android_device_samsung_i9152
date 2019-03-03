# Copyright 2013 The Android Open Source Project

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)


LOCAL_CFLAGS := -Werror \
    -Wno-unused-parameter \
    -Wall

LOCAL_SRC_FILES := \
    sdcard.cpp \
    fuse.cpp

LOCAL_MODULE := libsdcard_fuse

LOCAL_STATIC_LIBRARIES := \
    libbase \
    libcutils \
    libminijail \
    libpackagelistparser

include $(BUILD_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := main.c
LOCAL_MODULE := sdcard_fuse
LOCAL_MODULE_TAGS := optional
LOCAL_CFLAGS := -Werror \
    -Wno-unused-parameter \
    -Wall

LOCAL_STATIC_LIBRARIES := libsdcard_fuse

LOCAL_SHARED_LIBRARIES := \
    libbase \
    libc \
    libcutils \
    libminijail \
    libpackagelistparser

# Replace /system/bin/sdcard via symbolic link to /system/bin/sdcard_fuse
LOCAL_POST_INSTALL_CMD := $(hide) ln -sf /system/bin/sdcard_fuse $(TARGET_OUT)/bin/sdcard

include $(BUILD_EXECUTABLE)
