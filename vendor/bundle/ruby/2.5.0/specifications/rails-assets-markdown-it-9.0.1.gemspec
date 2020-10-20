# -*- encoding: utf-8 -*-
# stub: rails-assets-markdown-it 9.0.1 ruby lib

Gem::Specification.new do |s|
  s.name = "rails-assets-markdown-it".freeze
  s.version = "9.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["rails-assets.org".freeze]
  s.date = "2019-07-13"
  s.description = "Markdown parser, done right. Commonmark support, extensions, syntax plugins, high speed - all in one.".freeze
  s.homepage = "https://github.com/markdown-it/markdown-it".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.7.6.2".freeze
  s.summary = "Markdown parser, done right. Commonmark support, extensions, syntax plugins, high speed - all in one.".freeze

  s.installed_by_version = "2.7.6.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.3"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    else
      s.add_dependency(%q<bundler>.freeze, ["~> 1.3"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<bundler>.freeze, ["~> 1.3"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
  end
end
