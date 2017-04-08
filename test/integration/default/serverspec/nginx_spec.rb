require 'spec_helper'

describe 'Nginx' do
  describe service('nginx') do
    it { should be_enabled }
    it { should be_running }
  end

  describe port(80) do
    it { should be_listening.on('0.0.0.0').with('tcp') }
  end

  describe file('/etc/nginx/nginx.conf') do
    it { should be_file }
    it { should be_owned_by 'root'}
    its(:size) { should > 0 }
  end

  # conditional test case
  # describe file('/etc/nginx/sites-enabled/default') do
  #   it { should_not exist}
  # end
end