# Capistrano::DelayedJob [![Gem Version](https://badge.fury.io/rb/capistrano3-delayed-job.png)](http://badge.fury.io/rb/capistrano3-delayed-job)

Delayed Job support for Capistrano 3.x

## Installation

Add this line to your application's Gemfile:

    gem 'capistrano3-delayed-job', '~> 1.0'
    gem 'capistrano'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install capistrano3-delayed-job

## Usage

Require in `Capfile` to use the default task:

```ruby
require 'capistrano/delayed_job'
```

You will get the following tasks

```ruby
cap delayed_job:restart  # Restart the delayed_job process
cap delayed_job:start    # Start the delayed_job process
cap delayed_job:status   # Status of the delayed_job process
cap delayed_job:stop     # Stop the delayed_job process
```

Configurable options (copy into deploy.rb), shown here with examples:

```ruby
# Number of delayed_job workers
# default value: 1
set :delayed_job_workers, 2

# String to be prefixed to worker process names
# This feature allows a prefix name to be placed in front of the process.
# For example:  reports/delayed_job.0  instead of just delayed_job.0
set :delayed_job_prefix, 'reports'

# Delayed_job queue or queues
# Set the --queue or --queues option to work from a particular queue.
# default value: nil
set :delayed_job_queues, ['mailer','tracking']

# Specify different pools
# You can use this option multiple times to start different numbers of workers
# for different queues.
# NOTE: When using delayed_job_pools, the settings for delayed_job_workers and
# delayed_job_queues are ignored.
# default value: nil
#
# Single pool of 3 workers looking at all queues: (when alone, '*' is a
# special case meaning any queue)
# set :delayed_job_pools, { '*' => 3 }
# set :delayed_job_pools, { '' => 3 }
# set :delayed_job_pools, { nil => 3 }
#
# Several queues, some with their own dedicated pools: (symbol keys will be
# converted to strings)
# set :delayed_job_pools, {
#     :mailer => 2,    # 2 workers looking only at the 'mailer' queue
#     :tracking => 1,  # 1 worker exclusively for the 'tracking' queue
#     :* => 2          # 2 on any queue (including 'mailer' and 'tracking')
# }
#
# Several workers each handling one or more queues:
# set :delayed_job_pools, {
#     'high_priority' => 1,                # one just for the important stuff
#     'high_priority,*' => 1,              # never blocked by low_priority jobs
#     'high_priority,*,low_priority' => 1, # works on whatever is available
#     '*,low_priority' => 1,  # high_priority doesn't starve the little guys
#   }

# If you have several servers handling Delayed Jobs and you want to configure
# different pools per server, you can define delayed_job_pools_per_server:
#
# set :delayed_job_pools_per_server, {
#   'server11-prod' => {
#     'default,emails' => 3,
#     'loud_notifications' => 1,
#     'silent_notifications' => 1,
#   },
#   'server12-prod' => {
#     'default' => 2
#   }
# }

# Server names (server11-prod, server12-prod) in :delayed_job_pools_per_server
# must match the hostnames on Delayed Job servers. You can verify it by running
# `hostname` on your servers.

# If you use :delayed_job_pools_per_server, :delayed_job_pools will be ignored.

# Identification is assigned in order 0..3.
# Note that the '*' in this case is actually a queue with that name and does
# not mean any queue as it is not used alone, but alongside other queues.

# Set the roles where the delayed_job process should be started
# default value: :app
set :delayed_job_roles, [:app, :background]

# Set the location of the delayed_job executable
# Can be relative to the release_path or absolute
# default value: 'bin'
# set :delayed_job_bin_path, 'script' # for rails 3.x

# To pass the `-m` option to the delayed_job executable which will cause each
# worker to be monitored when daemonized.
# set :delayed_job_monitor, true

### Set the location of the delayed_job.log logfile
# default value: "#{Rails.root}/log" or "#{Dir.pwd}/log"
# set :delayed_log_dir, 'path_to_log_dir'

### Set the location of the delayed_job pid file(s)
# default value: "#{Rails.root}/tmp/pids" or "#{Dir.pwd}/tmp/pids"
# set :delayed_job_pid_dir, 'path_to_pid_dir'

### Set the options to be passed along to daemons when starting/stopping/restarting delayed_job workers
# options supported by daemons can be found at https://github.com/thuehlinger/daemons/blob/master/lib/daemons/cmdline.rb
# set :delayed_job_daemon_opts, ["no_wait", "shush"]
```

It also conditionally adds the following hook:

```ruby
  if Rake::Task.task_defined?('deploy:published')
    after 'deploy:published', 'delayed_job:default'
  end
```

Where the `delayed_job:default` is defined as:

```ruby
  task :default do
    invoke 'delayed_job:restart' if fetch(:delayed_job_default_hooks, true)
  end
```

Thus you can disable default hook by setting `delayed_job_default_hooks` to `false`. (It still gets _defined_, but will not do anything when called.)

```ruby
set :delayed_job_default_hooks, false
```

Following setting is recommended to avoid stop/restart problem.
See [Issue #16](https://github.com/platanus/capistrano3-delayed-job/issues/16) or [PR #22](https://github.com/platanus/capistrano3-delayed-job/pull/22) for more detail.

```ruby
set :linked_dirs, %w(tmp/pids)

# or

set :delayed_job_pid_dir, '/tmp'
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Credits

Thank you [contributors](https://github.com/AgileConsultingLLC/capistrano3-delayed-job/graphs/contributors)!

capistrano3-delayed-job is maintained [Rob Biedenharn](https://github.com/rab) and
[![Logo of Agile Consulting LLC](http://agileconsultingllc.com/agile-logo-small.png "Agile Consulting LLC")](http://agileconsultingllc.com/)

Originally developed by [Platanus](http://platan.us).

## License

capistrano3-delayed-job is © 2016 Platanus SpA. It is free software and may be redistributed under the terms specified in the LICENSE file.
