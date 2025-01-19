server 'budoman.eu', user: 'ubuntu', roles: %w[app db]

role :app, %w[ubuntu@budoman.eu]
role :db,  %w[ubuntu@budoman.eu]

set :ssh_options, {
  keys: %w[~/.ssh/aws_budoman],
  forward_agent: true,
  auth_methods: %w[publickey]
}

set :puma_service_unit_name, 'puma.service'
set :puma_restart_command, 'sudo /usr/bin/systemctl restart puma.service'
set :puma_systemctl_bin, '/usr/bin/systemctl'
set :puma_systemctl_user, :system
set :puma_rackup, -> { File.join(current_path, 'config.ru') }
set :puma_state, "#{shared_path}/tmp/pids/puma.state"
set :puma_pid, "#{shared_path}/tmp/pids/puma.pid"
set :puma_bind, "unix://#{shared_path}/tmp/sockets/puma.sock"
set :puma_conf, "#{shared_path}/config/puma.rb"
set :puma_access_log, "#{shared_path}/log/puma_access.log"
set :puma_error_log, "#{shared_path}/log/puma_error.log"
set :puma_role, :app
set :puma_env, 'production'
set :puma_threads, [0, 8]
set :puma_workers, 0
set :puma_worker_timeout, nil
set :puma_init_active_record, true
set :puma_preload_app, false

set :rbenv_map_bins, %w[rake gem bundle ruby rails puma pumactl sidekiq sidekiqctl]
