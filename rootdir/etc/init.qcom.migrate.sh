#!/system/bin/sh
# Copyright (c) 2009-2013, The Linux Foundation. All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above copyright
#       notice, this list of conditions and the following disclaimer in the
#       documentation and/or other materials provided with the distribution.
#     * Neither the name of The Linux Foundation nor
#       the names of its contributors may be used to endorse or promote
#       products derived from this software without specific prior written
#       permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NON-INFRINGEMENT ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR
# CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
# EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
# OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
# OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#

# Create native cgroup and move all tasks to it. Allot 15% real-time
# bandwidth limit to native cgroup (which is what remains after
# Android uses up 80% real-time bandwidth limit). root cgroup should
# become empty after all tasks are moved to native cgroup.

CGROUP_ROOT=/dev/cpuctl
mkdir $CGROUP_ROOT/native
echo 150000 > $CGROUP_ROOT/native/cpu.rt_runtime_us

# We could be racing with task creation, as a result of which its possible that
# we may fail to move all tasks from root cgroup to native cgroup in one shot.
# Retry few times before giving up.

for loop_count in 1 2 3
do
        for i in $(cat $CGROUP_ROOT/tasks)
        do
                echo $i > $CGROUP_ROOT/native/tasks
        done

        root_tasks=$(cat $CGROUP_ROOT/tasks)
        if [ -z "$root_tasks" ]
        then
                break
        fi
done

# Check if we failed to move all tasks from root cgroup
if [ ! -z "$root_tasks" ]
then
        echo "Error: Could not move all tasks to native cgroup"
fi
