# rubocop:disable Metrics/AbcSize, Metrics/MethodLength, Metrics/BlockLength
# rubocop:disable Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity
# rubocop:disable Style/SpaceInsideParens, Style/EmptyLinesAroundBlockBody

namespace :delayed_job do

  def delayed_job_args
    args = []
    args << "-m" if fetch(:delayed_job_monitor) # could be set to false
    args << "-n #{fetch(:delayed_job_workers)}" unless fetch(:delayed_job_workers).nil?
    args << "--queues=#{fetch(:delayed_job_queues).join(',')}" unless fetch(:delayed_job_queues).nil?
    args << "--prefix=#{fetch(:delayed_job_prefix)}" unless fetch(:delayed_job_prefix).nil?
    args << "--pid-dir=#{fetch(:delayed_job_pid_dir)}" unless fetch(:delayed_job_pid_dir).nil?
    args << "--log-dir=#{fetch(:delayed_log_dir)}" unless fetch(:delayed_log_dir).nil?
    if fetch(:delayed_job_pools_per_server, nil)
      server = capture(:hostname)
      args << fetch(:delayed_job_pools_per_server, {})[server].map {|k,v| "--pool='#{k}:#{v}'" }.join(' ')
    elsif fetch(:delayed_job_pools, nil)
      args << fetch(:delayed_job_pools, {}).map {|k,v| "--pool='#{k}:#{v}'" }.join(' ')
    end
    unless fetch(:delayed_job_daemon_opts).nil?
      args << "--daemon-options='--#{fetch(:delayed_job_daemon_opts, []).join(',--')}'"
    end
    args.join(' ')
  end

  def delayed_job_roles
    fetch(:delayed_job_roles)
  end

  def delayed_job_bin
    Pathname.new(fetch(:delayed_job_bin_path)).join('delayed_job')
  end

  desc 'Stop the delayed_job process'
  task :stop do
    on roles(delayed_job_roles) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :bundle, :exec, delayed_job_bin, delayed_job_args, :stop
        end
      end
    end
  end

  desc 'Start the delayed_job process'
  task :start do
    on roles(delayed_job_roles) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :bundle, :exec, delayed_job_bin, delayed_job_args, :start
        end
      end
    end
  end

  desc 'Status of the delayed_job process'
  task :status do
    on roles(delayed_job_roles) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          capture( :bundle, :exec, delayed_job_bin, delayed_job_args, :status ).each_line do |line|
            info line
          end
        end
      end
    end
  end

  desc 'Restart the delayed_job process'
  task :restart do
    on roles(delayed_job_roles) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :bundle, :exec, delayed_job_bin, delayed_job_args, :restart
        end
      end
    end
  end

  desc 'Default task - conditionally restart'
  task :default do
    invoke 'delayed_job:restart' if fetch(:delayed_job_default_hooks, true)
  end

  if Rake::Task.task_defined?('deploy:published')
    after 'deploy:published', 'delayed_job:default'
  end
end

namespace :load do
  task :defaults do
    set :delayed_job_workers, 1
    set :delayed_job_queues, nil
    set :delayed_job_pools, nil
    set :delayed_job_pools_per_server, nil
    set :delayed_job_roles, :app
    set :delayed_job_bin_path, 'bin'
    set :delayed_job_monitor, nil
    set :delayed_job_default_hooks, true
  end
end
