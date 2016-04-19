#default['jboss-my']['version'] = "6.1.0"
default['jboss-my']['install_path'] = '/opt'
default['jboss-my']['symlink'] = 'jboss'
default['jboss-my']['jboss_home'] = "#{node['jboss-my']['install_path']}/#{node['jboss-my']['symlink']}"
default['jboss-my']['config_dir'] = '/etc/jboss'
default['jboss-my']['package_dir'] = '/media/sf_vagrant/soft/jboss-as-6.1.0.zip'
default['jboss-my']['from_file'] = '/media/sf_vagrant/soft/jboss-as-6.1.0.zip'
#default['jboss-my']['checksum'] = '627773f1798623eb599bbf7d39567f60941a706dc971c17f5232ffad028bc6f4'
default['jboss-my']['log_dir'] = '/var/log/jboss'
default['jboss-my']['jboss_user'] = 'jboss'
default['jboss-my']['jboss_group'] = 'jboss'
#default['jboss-my']['admin_user'] = nil
#default['jboss-my']['admin_passwd'] = nil # Note the password has to be >= 8 characters, one numeric, one special
#default['jboss-my']['start_on_boot'] = no
