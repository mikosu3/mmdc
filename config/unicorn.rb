# -*- coding: utf-8 -*-
worker_processes 4

listen '/var/www/mmdc/tmp/unicorn.sock'
pid '/var/www/mmdc/tmp/unicorn.pid'

stderr_path File.expand_path('log/unicorn.log')
stdout_path File.expand_path('log/unicorn.log')

preload_app true