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
    port attrs['port']
    proxy_port attrs['proxy_port']
    ssl_port attrs['ssl_port']
    ssl_proxy_port attrs['ssl_proxy_port']
    ajp_port attrs['ajp_port']
    shutdown_port attrs['shutdown_port']
    config_dir attrs['config_dir']
    log_dir attrs['log_dir']
    work_dir attrs['work_dir']
    context_dir attrs['context_dir']
    webapp_dir attrs['webapp_dir']
    catalina_options attrs['catalina_options']
    java_options attrs['java_options']
    use_security_manager attrs['use_security_manager']
    authbind attrs['authbind']
    max_threads attrs['max_threads']
    ssl_max_threads attrs['ssl_max_threads']
    ssl_cert_file attrs['ssl_cert_file']
    ssl_key_file attrs['ssl_key_file']
    ssl_chain_files attrs['ssl_chain_files']
    keystore_file attrs['keystore_file']
    keystore_type attrs['keystore_type']
    truststore_file attrs['truststore_file']
    truststore_type attrs['truststore_type']
    certificate_dn attrs['certificate_dn']
    loglevel attrs['loglevel']
    tomcat_auth attrs['tomcat_auth']
    user attrs['user']
    group attrs['group']
    home attrs['home']
    base attrs['base']
    tmp_dir attrs['tmp_dir']
    lib_dir attrs['lib_dir']
    endorsed_dir attrs['endorsed_dir']
  end
end
    
