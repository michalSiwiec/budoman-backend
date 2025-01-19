lock '~> 3.19.1'

set :application, 'budoman-backend'
set :repo_url, 'git@github.com:kiwi439/budoman-backend.git'
set :deploy_to, '/var/www/budoman-backend'
set :format, :airbrussh
set :pty, true
set :default_env, { path: '/home/ubuntu/.rbenv/shims:/home/ubuntu/.rbenv/bin:/usr/local/bin:/usr/bin:/bin:$PATH' }
set :rbenv_ruby, '3.1.1'
set :bundle_flags
set :bundle_path, -> { shared_path.join('bundle') }

set :branch, 'master'
ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

set :local_user, -> { `git config user.name`.chomp }
set :keep_releases, 3
set :ssh_options, verify_host_key: :secure

append :linked_files, '.env'
append :linked_dirs, 'tmp/pids'
append :linked_dirs, 'tmp/sockets'
append :linked_dirs, 'log'
