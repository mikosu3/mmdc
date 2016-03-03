# -*- coding: utf-8 -*-
worker_processes 4

listen '/tmp/unicorn.sock'
pid '/tmp/unicorn.pid'

stderr_path File.expand_path('log/unicorn.log')
stdout_path File.expand_path('log/unicorn.log')

preload_app true