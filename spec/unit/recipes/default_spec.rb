#
# Cookbook Name:: iisnode
# Spec:: default
#
# Copyright (c) 2017 Aqovia, All Rights Reserved.

require 'spec_helper'

describe 'iisnode::default' do
  context 'When all attributes are default, on Windows Server 2012 R2' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(platform: 'windows', version: '2012r2') do |node|
        node.normal['iisnode']['store']['url'] = 'http://store/'
        node.normal['iisnode']['server']['installer']['x64']['file'] = 'fullx64.msi'
        node.normal['iisnode']['server']['installer']['x64']['checksum'] = 'fullx64sum'
      end
      runner.converge(described_recipe)
    end

    it 'selects the full x64 .msi' do
      expect(chef_run).to install_windows_package('iisnode').with(
        source: 'http://store/fullx64.msi',
        checksum: 'fullx64sum',
        action: [:install]
      )
    end

    it 'converges successfully' do
      chef_run # This should not raise an error
    end
  end

  context 'When all attributes are default, on Windows Server 2008 R2 32 bits' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(platform: 'windows', version: '2008r2') do |node|
        node.automatic['kernel']['machine'] = 'x86'
        node.normal['iisnode']['store']['url'] = 'http://store/'
        node.normal['iisnode']['server']['installer']['x86']['file'] = 'fullx86.msi'
        node.normal['iisnode']['server']['installer']['x86']['checksum'] = 'fullx86sum'
      end
      runner.converge(described_recipe)
    end

    it 'selects the full x86 .msi' do
      expect(chef_run).to install_windows_package('iisnode').with(
        source: 'http://store/fullx86.msi',
        checksum: 'fullx86sum',
        action: [:install]
      )
    end

    it 'converges successfully' do
      chef_run # This should not raise an error
    end
  end

  context 'When all attributes are default, on Windows 10' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(platform: 'windows', version: '10') do |node|
        node.normal['iisnode']['store']['url'] = 'http://store/'
        node.normal['iisnode']['desktop']['installer']['x86']['file'] = 'express86.msi'
        node.normal['iisnode']['desktop']['installer']['x86']['checksum'] = 'expressx86sum'
      end
      runner.converge(described_recipe)
    end

    it 'selects the express x86 .msi' do
      expect(chef_run).to install_windows_package('iisnode').with(
        source: 'http://store/express86.msi',
        checksum: 'expressx86sum',
        action: [:install]
      )
    end

    it 'converges successfully' do
      chef_run # This should not raise an error
    end
  end

  context 'Install full IIS on desktop windows, on Windows 10' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(platform: 'windows', version: '10') do |node|
        node.normal['iisnode']['store']['url'] = 'http://store/'
        node.normal['iisnode']['server']['installer']['x64']['file'] = 'fullx64.msi'
        node.normal['iisnode']['server']['installer']['x64']['checksum'] = 'fullx64sum'
        node.override['iisnode']['desktop_iis_edition'] = 'full'
      end
      runner.converge(described_recipe)
    end

    it 'selects the full x64 .msi' do
      expect(chef_run).to install_windows_package('iisnode').with(
        source: 'http://store/fullx64.msi',
        checksum: 'fullx64sum',
        action: [:install]
      )
    end

    it 'converges successfully' do
      chef_run # This should not raise an error
    end
  end
end
