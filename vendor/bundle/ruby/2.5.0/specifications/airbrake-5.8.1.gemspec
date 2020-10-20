# -*- encoding: utf-8 -*-
# stub: airbrake 5.8.1 ruby lib

Gem::Specification.new do |s|
  s.name = "airbrake".freeze
  s.version = "5.8.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Airbrake Technologies, Inc.".freeze]
  s.date = "2017-03-02"
  s.description = "Airbrake is an online tool that provides robust exception tracking in any of\nyour Ruby applications. In doing so, it allows you to easily review errors, tie\nan error to an individual piece of code, and trace the cause back to recent\nchanges. The Airbrake dashboard provides easy categorization, searching, and\nprioritization of exceptions so that when errors occur, your team can quickly\ndetermine the root cause.\n\nAdditionally, this gem includes integrations with such popular libraries and\nframeworks as Rails, Sinatra, Resque, Sidekiq, Delayed Job, Shoryuken,\nActiveJob and many more.\n".freeze
  s.email = "support@airbrake.io".freeze
  s.homepage = "https://airbrake.io".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.0".freeze)
  s.rubygems_version = "2.7.6.2".freeze
  s.summary = "Airbrake is an online tool that provides robust exception tracking in any of your Ruby applications.".freeze

  s.installed_by_version = "2.7.6.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<airbrake-ruby>.freeze, ["~> 1.8"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3"])
      s.add_development_dependency(%q<rspec-wait>.freeze, ["~> 0"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 12"])
      s.add_development_dependency(%q<pry>.freeze, ["~> 0"])
      s.add_development_dependency(%q<appraisal>.freeze, ["~> 2"])
      s.add_development_dependency(%q<rack>.freeze, ["~> 1"])
      s.add_development_dependency(%q<webmock>.freeze, ["~> 2"])
      s.add_development_dependency(%q<nokogiri>.freeze, ["= 1.6.8.1"])
      s.add_development_dependency(%q<rack-test>.freeze, ["~> 0"])
      s.add_development_dependency(%q<sidekiq>.freeze, ["~> 4"])
      s.add_development_dependency(%q<rubocop>.freeze, ["~> 0.47"])
    else
      s.add_dependency(%q<airbrake-ruby>.freeze, ["~> 1.8"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3"])
      s.add_dependency(%q<rspec-wait>.freeze, ["~> 0"])
      s.add_dependency(%q<rake>.freeze, ["~> 12"])
      s.add_dependency(%q<pry>.freeze, ["~> 0"])
      s.add_dependency(%q<appraisal>.freeze, ["~> 2"])
      s.add_dependency(%q<rack>.freeze, ["~> 1"])
      s.add_dependency(%q<webmock>.freeze, ["~> 2"])
      s.add_dependency(%q<nokogiri>.freeze, ["= 1.6.8.1"])
      s.add_dependency(%q<rack-test>.freeze, ["~> 0"])
      s.add_dependency(%q<sidekiq>.freeze, ["~> 4"])
      s.add_dependency(%q<rubocop>.freeze, ["~> 0.47"])
    end
  else
    s.add_dependency(%q<airbrake-ruby>.freeze, ["~> 1.8"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3"])
    s.add_dependency(%q<rspec-wait>.freeze, ["~> 0"])
    s.add_dependency(%q<rake>.freeze, ["~> 12"])
    s.add_dependency(%q<pry>.freeze, ["~> 0"])
    s.add_dependency(%q<appraisal>.freeze, ["~> 2"])
    s.add_dependency(%q<rack>.freeze, ["~> 1"])
    s.add_dependency(%q<webmock>.freeze, ["~> 2"])
    s.add_dependency(%q<nokogiri>.freeze, ["= 1.6.8.1"])
    s.add_dependency(%q<rack-test>.freeze, ["~> 0"])
    s.add_dependency(%q<sidekiq>.freeze, ["~> 4"])
    s.add_dependency(%q<rubocop>.freeze, ["~> 0.47"])
  end
end
