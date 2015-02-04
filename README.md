# autossh-init-cookbook

Configure autossh-init

## Supported Platforms

* redhat centos fedora scientific amazon oracle

## Usage

### autossh-init::default

Include `autossh-init` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[autossh-init::default]"
  ]
}
```

License and Authors
-------------------

- Author:: Nico Kadel-Garcia <nkadel@skyhookwireless.com>

```text
Copyright 2014, Skyhook Wireless

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```

Requirements
------------
## autossh software
autossh softwae must be available as a package

### Platform
* redhat
* centos
* fedora
* scientific
* amazon
* oracle

**Notes** This has only been tested on RPM based systems running SysV init
scripts. It does not currently support systemd or upstart based
operating systems.

Attributes
----------

### default
* `node['autossh-init']['sysconfigdir']` - default '/etc/sysconfig'.
* `node['autossh-init']['autossh_user']` - override init script setting of 'autossl', default 'nil'
* `node['autossh-init']['autossh_poll']` - override init script setting of '5', default 'nil'
* `node['autossh-init']['autossh_opts']` - override init script setting of '-M 0', default 'nil'
* `node['autossh-init']['ssh_opts']` - override init script setting of '-vv -f -N', default 'nil'
* `node[autossh-init']['ssh_lports']` - set forward ports, default 'nil'
* `node[autossh-init']['ssh_rports']` - set reverse ports, default 'nil'
* `node[autossh-init']['ssh_host']` - set SSH host target, default 'nil'

Recipes
-------
### default
* Installs the 'autossh' package.
* Installs 'autossh' init script.
* Deploys configuration in /etc/sysconfig/autossh.
* Enables or disables 'autossh' init script based on 'ssh_lports' or 'ssh_rports' being enabled.
* Activates log rotation in /var/log/autossh/

### instances
* Creates or deletes 'autossh-instance' symlinks to base 'autossh' init script.
* Deploys or deletes relevant config files in /etc/sysconfig/'autossh-instance'.
* Activates autossh instances based on availability of 'ssh_lports' or 'ssh_rports' settings.
