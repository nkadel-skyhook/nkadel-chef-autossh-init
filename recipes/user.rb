#
# Cookbook Name:: autossh-init
# Recipe:: user
#
# Copyright (C) 2015 Skyhook Wireless
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

# Include autossh creation here because 'users' cookbook autopupulates
# $HOME and $HOME/.ssh, which breaks various configurations
user 'autossh' do
  action :create
  comment node['autossh-init']['user']['comment']
  home node['autossh-init']['user']['home']
  shell node['autossh-init']['user']['shell']
  system node['autossh-init']['user']['system']
  username node['autossh-init']['user']['username']
end

directory node['autossh-init']['user']['home'] do
  owner node['autossh-init']['user']['uid']
  group node['autossh-init']['user']['gid']
  mode '0700'
end

directory node['autossh-init']['user']['home'] + 'ssh' do
  owner node['autossh-init']['user']['uid']
  group node['autossh-init']['user']['gid']
  mode '0700'
end
