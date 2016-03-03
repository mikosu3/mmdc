# -*- coding: utf-8 -*-
working_directory "/var/www/mmdc"
worker_processes 4

listen "/var/www/mmdc/tmp/unicorn.sock", :backlog => 64
listen 5000, :tcp_nopush => true
#listen '/var/www/mmdc/tmp/unicorn.sock'

pid '/var/www/mmdc/tmp/unicorn.pid'

stderr_path File.expand_path('log/unicorn.log')
stdout_path File.expand_path('log/unicorn.log')

preload_app true