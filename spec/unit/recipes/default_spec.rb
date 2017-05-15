#
# Cookbook Name:: iisnode
# Spec:: default
#
# Copyright (c) 2017 Aqovia, All Rights Reserved.

require 'spec_helper'

describe 'iisnode::default' do
  context 'When all attributes are default, on Windows Server 2012 R2' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(platform: 'windows', version: '2012r2')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      chef_run # This should not raise an error
    end
  end
end
