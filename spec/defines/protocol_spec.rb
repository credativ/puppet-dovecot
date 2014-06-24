require 'rubygems'
require 'puppetlabs_spec_helper/module_spec_helper'

describe 'dovecot::protocol' do
  context 'imap' do
    let(:title) { 'imap' }

    it {
      should contain_class('dovecot')
      should contain_package('dovecot-imapd')
    }
  end

  context 'sieve' do
    let(:title) { 'sieve' }

    it {
      should contain_class('dovecot')
      should contain_package('dovecot-managesieved')
    }
  end

  context 'unknown' do
    let(:title) { 'unknown' }

    it {
      expect {
        should compile
      }.to raise_error(Puppet::Error, /selector param/)
    }
  end
end
