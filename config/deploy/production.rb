server '52.193.88.163', user: 'app', roles: %w{app db web}
set :ssh_options, keys: '/home/ubuntu/.ssh/aws_rsa'