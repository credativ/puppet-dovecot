require 'rubygems'
require 'puppetlabs_spec_helper/module_spec_helper'

describe 'dovecot::protocol' do
  context 'Default imap' do
    let(:title) { 'imap' }

    it {
      should contain_class('dovecot')
      should contain_package('dovecot-imapd')
    }
  end
end
