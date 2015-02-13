
default['autossh-init']['user']['comment'] = 'Autossh user'
default['autossh-init']['user']['home'] = '/var/lib/autossh'
default['autossh-init']['user']['shell'] = '/sbin/nologin'
default['autossh-init']['user']['system'] = true
default['autossh-init']['user']['username'] = 'autossh'

# Not currently in use, rely on 'system' setting
#default['autossh-init']['user']['uid'] = '491'
#default['autossh-init']['user']['gid'] = '491'
