# -*- encoding: utf-8 -*-
# stub: capybara-webmock 0.5.5 ruby lib

Gem::Specification.new do |s|
  s.name = "capybara-webmock".freeze
  s.version = "0.5.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Jake Worth".freeze, "Dillon Hafer".freeze]
  s.date = "2019-10-08"
  s.description = "Mock external requests for Capybara JavaScript drivers".freeze
  s.email = ["dev@hashrocket.com".freeze]
  s.homepage = "https://github.com/hashrocket/capybara-webmock".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.0.0".freeze)
  s.rubygems_version = "2.7.6.2".freeze
  s.summary = "Mock external requests".freeze

  s.installed_by_version = "2.7.6.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<capybara>.freeze, ["< 4", ">= 2.4"])
      s.add_runtime_dependency(%q<rack>.freeze, [">= 1.4"])
      s.add_runtime_dependency(%q<rack-proxy>.freeze, [">= 0.6.0"])
      s.add_runtime_dependency(%q<selenium-webdriver>.freeze, ["~> 3.0"])
      s.add_development_dependency(%q<bundler>.freeze, [">= 1.13"])
      s.add_development_dependency(%q<pry>.freeze, ["~> 0.10.4"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0"])
      s.add_development_dependency(%q<simplecov>.freeze, [">= 0"])
      s.add_development_dependency(%q<sinatra>.freeze, [">= 0"])
      s.add_development_dependency(%q<launchy>.freeze, [">= 0"])
    else
      s.add_dependency(%q<capybara>.freeze, ["< 4", ">= 2.4"])
      s.add_dependency(%q<rack>.freeze, [">= 1.4"])
      s.add_dependency(%q<rack-proxy>.freeze, [">= 0.6.0"])
      s.add_dependency(%q<selenium-webdriver>.freeze, ["~> 3.0"])
      s.add_dependency(%q<bundler>.freeze, [">= 1.13"])
      s.add_dependency(%q<pry>.freeze, ["~> 0.10.4"])
      s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
      s.add_dependency(%q<simplecov>.freeze, [">= 0"])
      s.add_dependency(%q<sinatra>.freeze, [">= 0"])
      s.add_dependency(%q<launchy>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<capybara>.freeze, ["< 4", ">= 2.4"])
    s.add_dependency(%q<rack>.freeze, [">= 1.4"])
    s.add_dependency(%q<rack-proxy>.freeze, [">= 0.6.0"])
    s.add_dependency(%q<selenium-webdriver>.freeze, ["~> 3.0"])
    s.add_dependency(%q<bundler>.freeze, [">= 1.13"])
    s.add_dependency(%q<pry>.freeze, ["~> 0.10.4"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0"])
    s.add_dependency(%q<sinatra>.freeze, [">= 0"])
    s.add_dependency(%q<launchy>.freeze, [">= 0"])
  end
end
