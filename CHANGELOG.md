autossh-init Cookbook CHANGELOG
===============================
This file is used to list changes made in each version of the
autossh_init cookbook.

v0.1.8
------
- Check for correct 'autossh' process in init script status report

v0.1.7
------
- Deploy ssh/config file to set 'StrictHostKeyChecking no',
  since piping SSH options through /etc/sysconfig/autossh gets nightmarish

v0.1.5
------
- Deploy /lsb/lib/init-functions as needed

v0.1.4
------
- Activate default 'autossh' user
- Deploy directories as needed

v0.1.3
------
- Improve README.md
- Activate 'ssh_hosts' attributes

v0.1.2
------
- Change name to 'autossh-init'
- Activate attributes in template
- Disable base autossh startup unless ssh_lports or ssh_rports enabled.

v0.1.1
------
- Add logrotate for /var/log/autossh/*log
- Discard autossh.tab
- Deploy init scripts based on 'instance' settings

v0.1.0
------
- Initial release of autossh_init
