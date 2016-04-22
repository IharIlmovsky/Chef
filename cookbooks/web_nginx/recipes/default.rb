#
# Cookbook Name:: web_nginx
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
web 'Install nginx' do
  provider 'web_nginx'
  action :install
end

web 'Configure nginx' do
  provider 'web_nginx'
  action :configure
end
