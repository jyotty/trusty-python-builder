# encoding: UTF-8

TRUSTY_BOX_BASE_URL = 'https://cloud-images.ubuntu.com/vagrant/trusty/current'
TRUSTY_BOX_FILENAME = 'trusty-server-cloudimg-amd64-vagrant-disk1.box'

Vagrant.configure('2') do |config|
  config.vm.box = 'cloudimg-trusty'
  config.vm.box_url = File.join(TRUSTY_BOX_BASE_URL, TRUSTY_BOX_FILENAME)
  config.vm.box_download_checksum = File.readlines('vagrant/SHA256SUMS').find {|x| x =~ /#{TRUSTY_BOX_FILENAME}$/ }.split.first
  config.vm.box_download_checksum_type = 'sha256'

  config.vm.synced_folder "python/", "/srv/python"

  config.vm.provider 'virtualbox' do |v|
    v.memory = 1024
    v.cpus = 2
  end

  config.vm.provision 'shell', path: 'python/prereq.sh'
end
