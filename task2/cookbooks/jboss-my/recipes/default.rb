include_recipe "unzip"
include_recipe "java"

jboss_user = node['jboss-my']['jboss_user']
jboss_group = node['jboss-my']['jboss_group']

# Create JBoss User
user node['jboss-my']['jboss_user'] do
	action :create
end

#zipfile node['jboss-my']['package-dir'] do
#  into ['jboss-my']['install-path']
#  action :extract  
#end

bash "put_files" do
  code <<-EOF  
  mkdir /opt/jboss
  unzip /media/sf_vagrant/soft/jboss-as-6.1.0.zip -d /opt/jboss
  chown -R jboss:jboss /opt/jboss
  EOF
  not_if { ::File.file?('/media/sf_vagrant/soft/jboss-as-6.1.0.zip') }
end

# Init script config dir
directory node['jboss-my']['config_dir'] do
        owner jboss_user
        group jboss_user
	mode "0755"
end

# Init script config file
template "#{node['jboss-my']['config_dir']}/jboss-as.conf" do
  source 'jboss-as.conf.erb'
  owner 'root'
  group 'root'
  mode "0644"
end

# Init script
cookbook_file "/etc/init.d/jboss" do
   source "jboss-as-standalone-init.sh"
   mode "0755"
   owner "root"
   group "root"
end

# Manage log directory
default_log_dir = "#{node['jboss-my']['jboss_home']}/standalone/log"

# Delete default log directory if it's not a symlink and not the same as the specified log_dir
directory default_log_dir do
 	action :delete
 	not_if { node['jboss-my']['log_dir'] == default_log_dir }
 	not_if "test -L #{default_log_dir}"
end

# Create log directory
directory node['jboss-my']['log_dir'] do
 	owner node['jboss-my']['jboss_user']
 	group node['jboss-my']['jboss_group']
 	mode "2775"
end

# Log directory symlink
# link default_log_dir do
# 	to node['jboss-my']['log_dir']
# 	owner node['jboss-my']['jboss_user']
# 	group node['jboss-my']['jboss_group']
# 	not_if { node['jboss-my']['log_dir'] == default_log_dir }
# end


# Add admin user if the user is not found in mgmt-users.properties
#if node['jboss-my']['admin_user'] && node['jboss-my']['admin_passwd']
#  execute "add_admin_user" do
# 		command "#{node['jboss-my']['jboss_home']}/bin/add-user.sh --silent -u #{node['jboss-my']['admin_user']} -p #{node['jboss-my']['admin_passwd']}"
# 	not_if "grep ^#{node['jboss-my']['admin_user']} #{node['jboss-my']['jboss_home']}/standalone/configuration/mgmt-users.properties"	
#  end
#end


# Enable service on boot if requested
service "jboss" do
  if node['jboss-my']['start_on_boot']
    action :enable
  else
    action :disable
  end
end



# Starting Jboss
service "jboss" do
  action :start
end

remote_file '/opt/jboss/server/default/deploy/sample.war' do
  source 'https://tomcat.apache.org/tomcat-7.0-doc/appdev/sample/sample.war'
  owner 'jboss'
  group 'jboss'
  mode '0755'
  action :create
end

# Copying init script
#cookbook_file '/etc/init.d/jboss' do
#  source 'jboss_init_redhat.sh'
#  owner 'jboss'
#  group 'jboss'
#  mode '0755'
#  action :create
#end
