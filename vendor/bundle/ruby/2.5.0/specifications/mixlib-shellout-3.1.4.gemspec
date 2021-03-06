# -*- encoding: utf-8 -*-
# stub: mixlib-shellout 3.1.4 ruby lib

Gem::Specification.new do |s|
  s.name = "mixlib-shellout".freeze
  s.version = "3.1.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Chef Software Inc.".freeze]
  s.date = "2020-08-13"
  s.description = "Run external commands on Unix or Windows".freeze
  s.email = "info@chef.io".freeze
  s.homepage = "https://github.com/chef/mixlib-shellout".freeze
  s.required_ruby_version = Gem::Requirement.new(">= 2.4".freeze)
  s.rubygems_version = "2.7.6.2".freeze
  s.summary = "Run external commands on Unix or Windows".freeze

  s.installed_by_version = "2.7.6.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<chef-utils>.freeze, [">= 0"])
    else
      s.add_dependency(%q<chef-utils>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<chef-utils>.freeze, [">= 0"])
  end
end
