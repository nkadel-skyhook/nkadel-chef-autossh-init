# Author:: Nico Kadel-Garcia <nkadel@skyhookwireless.com>
# Copyright 2014, Skyhook Wireless
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

default['autossh-init']['sysconfigdir'] = '/etc/sysconfig'

#default['autossh-init']['autossh_user'] = nil
default['autossh-init']['autossh_user'] = 'autossh'
default['autossh-init']['autossh_poll'] = nil
#default['autossh-init']['autossh_poll'] = '5'
default['autossh-init']['autossh_opts'] = nil
#default['autossh-init']['autossh_opts'] = '-vv -f -N'


# Disabled by default, sample ports local port 2222 to remote localhost port 22
default['autossh-init']['ssh_lports'] = nil
#default['autossh-init']['ssh_lports'] = '-Llocalhost:2222:localhost:22'

# Disabled by default, sample ports remote host port 2222 to localhost 22
default['autossh-init']['ssh_rports'] = nil
#default['autossh-init']['ssh_lports'] = '-Rlocalhost:2022:localhost:22'



