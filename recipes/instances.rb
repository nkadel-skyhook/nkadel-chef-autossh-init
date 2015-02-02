#
# Cookbook Name:: autossh-init
# Recipe:: instances
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

include_recipe 'autossh-init::default'

node['autossh']['instances'].each do|name, attr|
  autossh_instance "#{name}" do
    autossh_user attrs['autossh_user']
    autossh_poll attrs['autossh_poll']
    autossh_opts attrs['autossh_opts']
    ssh_opts attrs['ssh_opts']
    ssh_lports attrs['ssh_lports']
    ssh_rports attrs['ssh_rports']
  end
end
    
