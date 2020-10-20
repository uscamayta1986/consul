# -*- encoding: utf-8 -*-
# stub: initialjs-rails 0.2.0.9 ruby lib

Gem::Specification.new do |s|
  s.name = "initialjs-rails".freeze
  s.version = "0.2.0.9"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["David Gil".freeze]
  s.bindir = "exe".freeze
  s.date = "2020-05-22"
  s.description = "initialjs-rails is an assets gem for initial.js".freeze
  s.email = ["dgilperez@gmail.com".freeze]
  s.homepage = "https://github.com/dgilperez/initialjs-rails".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.7.6.2".freeze
  s.summary = "initial.js for Rails".freeze

  s.installed_by_version = "2.7.6.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<railties>.freeze, ["< 7.0", ">= 3.1"])
      s.add_development_dependency(%q<bundler>.freeze, [">= 0"])
      s.add_development_dependency(%q<rake>.freeze, [">= 12.3.3"])
      s.add_development_dependency(%q<rspec>.freeze, [">= 0"])
      s.add_development_dependency(%q<appraisal>.freeze, [">= 0"])
    else
      s.add_dependency(%q<railties>.freeze, ["< 7.0", ">= 3.1"])
      s.add_dependency(%q<bundler>.freeze, [">= 0"])
      s.add_dependency(%q<rake>.freeze, [">= 12.3.3"])
      s.add_dependency(%q<rspec>.freeze, [">= 0"])
      s.add_dependency(%q<appraisal>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<railties>.freeze, ["< 7.0", ">= 3.1"])
    s.add_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 12.3.3"])
    s.add_dependency(%q<rspec>.freeze, [">= 0"])
    s.add_dependency(%q<appraisal>.freeze, [">= 0"])
  end
end
