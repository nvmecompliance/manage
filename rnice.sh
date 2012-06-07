#!/bin/bash

# Copyright (c) 2011, Intel Corporation.
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.
#
sleep 5
spid=$(pgrep svlogd)
if [[ $spid > 0 ]]; then
    echo "Changing svlogd priority to 10"
    sudo renice +10 $spid
fi

tpid=$(pgrep tnvme)
if [[ $tpid > 0 ]]; then
   echo "Changing tnvme priority to 1"
   sudo renice +1 $tpid
fi
