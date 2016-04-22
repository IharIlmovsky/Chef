#
# Cookbook Name:: web
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

if node.role?('apache_server')
    include_recipe "web_apache"
elsif node.role?('nginx_server')
    include_recipe "web_nginx"
end

