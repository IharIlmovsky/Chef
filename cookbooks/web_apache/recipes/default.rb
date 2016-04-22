#
# Cookbook Name:: web_apache
# Recipe:: default
#

web 'Install apache' do
  provider 'web_apache'
  action :install
end

web 'Configure apache' do
  provider 'web_apache'
  action :configure
end
