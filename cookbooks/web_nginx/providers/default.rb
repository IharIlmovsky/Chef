#
# Cookbook:: web_apache
# Provider:: default
#

action :install do
package 'Install Nginx' do
  package_name 'nginx'
  action :install
end

service "nginx" do
  action [ :enable, :start ]
end

end

action :start do
  service 'nginx' do
      action :start
  end 
end

action :stop do
  service 'nginx' do
      action :stop
  end 
end

cookbook_file '/etc/nginx/conf.d/default.conf' do
  source 'default.conf'
  owner 'nginx'
  group 'nginx'
  mode '0755'
  action :create
end

service "nginx" do
  action :restart
end

end