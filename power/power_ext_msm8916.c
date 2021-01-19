/*
 * Copyright (c) 2016 The CyanogenMod Project
 * Copyright (C) 2021 The LineageOS Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <errno.h>
#include <stdlib.h>
#include <string.h>
#include <fcntl.h>

#define LOG_TAG "PowerHAL_MSM8916_Ext"
#include <utils/Log.h>

#define CPU0 "/sys/devices/system/cpu/cpu0/online"
#define CPU1 "/sys/devices/system/cpu/cpu1/online"

static void sysfs_write(char *path, char *s)
{
    char buf[80];
    int len;
    int fd;

    if ((fd = open(path, O_WRONLY)) < 0) {
        strerror_r(errno, buf, sizeof(buf));
        ALOGE("Error opening %s: %s\n", path, buf);
        return;
    }

    len = write(fd, s, strlen(s));
    if (len < 0) {
        strerror_r(errno, buf, sizeof(buf));
        ALOGE("Error writing to %s: %s\n", path, buf);
    }

    close(fd);
}

void power_set_interactive_ext(int on)
{
/* turnON cpu2 and cpu3 after sleep as core_ctl fails to turnON CPUs sometimes */
     if (on) {
         ALOGD("TurningOn Cpus");
         sysfs_write(CPU0, "1");
         sysfs_write(CPU1, "1");
     }
}
