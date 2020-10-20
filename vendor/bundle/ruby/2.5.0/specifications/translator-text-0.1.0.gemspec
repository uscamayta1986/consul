# -*- encoding: utf-8 -*-
# stub: translator-text 0.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "translator-text".freeze
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Aymeric Brisse".freeze]
  s.date = "2018-08-28"
  s.description = "API Wrapper for the Microsoft Translator Text API (Cognitive Services)".freeze
  s.email = ["aymeric.brisse@perfect-memory.com".freeze]
  s.homepage = "https://github.com/PerfectMemory/translator-text".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.7.6.2".freeze
  s.summary = "API Wrapper for the Microsoft Translator Text API".freeze

  s.installed_by_version = "2.7.6.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<dry-struct>.freeze, ["~> 0.5.0"])
      s.add_runtime_dependency(%q<httparty>.freeze, ["~> 0.15"])
    else
      s.add_dependency(%q<dry-struct>.freeze, ["~> 0.5.0"])
      s.add_dependency(%q<httparty>.freeze, ["~> 0.15"])
    end
  else
    s.add_dependency(%q<dry-struct>.freeze, ["~> 0.5.0"])
    s.add_dependency(%q<httparty>.freeze, ["~> 0.15"])
  end
end
