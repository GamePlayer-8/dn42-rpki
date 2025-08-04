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

INTERVAL="${INTERVAL:-7200}"
REMOTE_BRANCH="${REMOTE_BRANCH:-master}"

update() {
	until [ -d /var/lib/registry/data ]; do sleep 1; done

	until ! pgrep -x "git" >/dev/null; do sleep 1; done
	until ! pgrep -f "git" >/dev/null; do sleep 1; done

	cd /var/lib/registry
	git fetch --all
	git reset --hard origin/"$REMOTE_BRANCH"
	kill -SIGUSR1 "$(pidof 'registry_wizard')"
	return $?
}

while [ 1 ]; do
	update
	sleep "$INTERVAL"
done
