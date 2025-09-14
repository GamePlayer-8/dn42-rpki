#!/bin/sh

#
#  Copyright    2022-2025       Echedelle López Romero
#  Copyright    2024-2025       Chimmie Firefly
#
#  Licensed to the Apache Software Foundation (ASF) under one or more
#  contributor license agreements.  See the NOTICE file distributed with
#  this work for additional information regarding copyright ownership.
#  The ASF licenses this file to You under the Apache License, Version 2.0
#  (the "License"); you may not use this file except in compliance with
#  the License.  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
#

REMOTE_DATA="${REMOTE_DATA:-https://git.chimmie.k.vu/IP/registry.git}"

if ! [ -d /var/lib/registry/data ]; then
        cd /var/lib
        rm -rf registry 2>/dev/null
	exit_code=1
	until [ "$exit_code" = "0" ]; do
	        git clone --recursive "$REMOTE_DATA"
		exit_code=$?
		sleep 1
	done
fi

until [ "$(git -C /var/lib/registry status >/dev/null 2>&1; echo $?)" = "0" ]; do sleep 1; done
