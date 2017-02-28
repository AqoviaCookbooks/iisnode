#
# Cookbook Name:: iisnode
# Recipe:: default
#
# Copyright (c) 2017 Aqovia, All Rights Reserved.

if node['iisnode']['iis_flavour'] == 'full' && node['kernel']['machine'] =~ /x86_64/ 
    package_name = 'iisnode-full-v0.2.21-x64.msi'
    checksum = '9C65D9E45466B9852D411CF59B039011740A321C02D190AB2128F9F9280BD457'

elsif node['iisnode']['iis_flavour'] == 'full' && node['kernel']['machine'] !~ /x86_64/
    package_name = 'iisnode-full-v0.2.21-x86.msi'
    checksum = 'CCFA4FED49CA3A1B744E1318BA1DF44F058FE6D2876E1BE54B3A9F0366BFD41D'

elsif node['iisnode']['iis_flavour'] == 'express'
    package_name = 'iisnode-express-v0.2.21-x86.msi'
    checksum = '32A45ABB3316662F2E34EBBFFEFB5CDDE66361355A3C35907FD22349C0003E2B'

else
    raise ("Not able to find matching iisnode package for IIS flavour: " + ['iisnode']['iis_flavour'] + "\nSupported flavours are 'full' and 'express'")
end

url = 'https://github.com/azure/iisnode/releases/download/v0.2.21/' + package_name

windows_package 'iisnode' do
  checksum checksum
  source url
  action :install
end
