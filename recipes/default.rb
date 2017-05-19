#
# Cookbook Name:: iisnode
# Recipe:: default
#
# Copyright (c) 2017 Aqovia, All Rights Reserved.

is_server = ::Windows::VersionHelper.server_version?(node)

if !is_server && node['iisnode']['desktop_iis_edition'] == 'express'
  package_name = node['iisnode']['desktop']['installer']['x86']['file']
  checksum = node['iisnode']['desktop']['installer']['x86']['checksum']

elsif node['kernel']['machine'] =~ /x86_64/
  package_name = node['iisnode']['server']['installer']['x64']['file']
  checksum = node['iisnode']['server']['installer']['x64']['checksum']

elsif node['kernel']['machine'] !~ /x86_64/
  package_name = node['iisnode']['server']['installer']['x86']['file']
  checksum = node['iisnode']['server']['installer']['x86']['checksum']

else
  raise('Not able to find matching iisnode package for IIS edition: ' + node['iisnode']['desktop_iis_edition'] + "\nSupported editions are 'full' and 'express'")
end

url = node['iisnode']['store']['url'] + package_name

include_recipe 'iis_urlrewrite'

windows_package 'iisnode' do
  checksum checksum
  source url
  action :install
end
