require 'rubygems'
require 'puppetlabs_spec_helper/module_spec_helper'

describe 'dovecot' do
  context "With default facts" do
    it {
      should contain_service('dovecot')
    }
  end
end
