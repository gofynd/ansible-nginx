require 'spec_helper'

describe 'Nginx' do
  describe service('nginx') do
    it { should be_enabled }
    it { should be_running }
  end

  describe file('/var/log/nginx/access.log') do
    it { should be_file }
    it { should be_owned_by 'www-data' }
  end

  describe file('/var/log') do
    it { should be_directory }
    it { should_not be_owned_by('nginx') }
  end
end