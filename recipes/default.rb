#
# Cookbook Name:: autossh-init
# Recipe:: default
#
# Copyright (C) 2014 Skyhook Wireless
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


package "autossh"

# init script currently depends on lsb-functions for pgrep
case node[:platrfom]
when "redhat", "centos", "scientific", "oracle"
  package "redhat-lsb-core" do
    action :install
  end
end

cookbook_file '/etc/logrotate.d/autossh' do
  source 'autossh.logrotate'
  mode 0644
  owner 'root'
  group 'root'
end

template node['autossh-init']['sysconfigdir'] + '/autossh' do
  source 'autossh.sysconfig.erb'
  owner 'root'
  group 'root'
  mode '0644'
  variables({
    :autossh_user => node['autossh-init']['autossh_user'],
    :autossh_poll => node['autossh-init']['autossh_poll'],
    :autossh_opts => node['autossh-init']['autossh_opts'],
    :ssh_opts => node['autossh-init']['ssh_opts'],
    :ssh_lports => node['autossh-init']['ssh_lports'],
    :ssh_rports => node['autossh-init']['ssh_rports'],
    :ssh_host => node['autossh-init']['ssh_host']
  })
  # Simply publish reference template if no ports enabled
  if node['autossh-init']['ssh_lports'].nil? && node['autossh-init']['ssh_rports'].nil?
    notifies :disable, 'service[autossh]', :delayed
  else
    notifies :restart, 'service[autossh]', :delayed
  end
end

# Configure base autossh, disabled by default
cookbook_file '/etc/init.d/autossh' do
  source 'autossh.init'
  mode 0755
  owner 'root'
  group 'root'
  if node['autossh-init']['ssh_lports'].nil? && node['autossh-init']['ssh_rports'].nil?
    notifies :disable, 'service[autossh]', :delayed
#Disable check for valid ssh_host for now, let startup fail
#  elsif node['autossh-init']['ssh_host'].nil?
#    notifies :disable, 'service[autossh]', :delayed
  else
    notifies :restart, 'service[autossh]', :delayed
  end
end

service 'autossh' do
  action [:nothing]
  supports :stop => true, :restart => true, :reload => true, :status => true
end

