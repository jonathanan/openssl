describe key_rsa('/etc/ssl_test/rsakey_des3.pem') do
  it { should be_private }
  its('key_length') { should eq 2048 }
end

describe key_rsa('/etc/ssl_test/rsakey_aes128cbc.pem') do
  it { should be_private }
  its('key_length') { should eq 1024 }
end

describe command('openssl dhparam -in /etc/ssl_test/dhparam.pem -check -noout') do
  its('exit_status') { should eq 0 }
end

describe command('openssl rsa -in /etc/ssl_test/mycert.key -check -noout') do
  its('exit_status') { should eq 0 }
end

describe command('openssl x509 -in /etc/ssl_test/mycert.crt -noout') do
  its('exit_status') { should eq 0 }
end
