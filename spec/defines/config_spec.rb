require 'rubygems'
require 'puppetlabs_spec_helper/module_spec_helper'

describe 'dovecot::config' do
  context 'Default parameters' do
    let(:title) { 'test' }

    it {
      should contain_class('dovecot')
      should contain_file('/etc/dovecot/conf.d/test.conf')
        .with_content(nil)
        .with_source(nil)
    }
  end

  context 'Default content' do
    let(:title) { 'test' }
    let(:params) { { :content => 'content' } }

    it {
      should contain_file('/etc/dovecot/conf.d/test.conf')
        .with_content('content')
        .with_source(nil)
    }
  end
end
