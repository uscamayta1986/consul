# -*- encoding: utf-8 -*-
# stub: globalize-accessors 0.2.1 ruby lib

Gem::Specification.new do |s|
  s.name = "globalize-accessors".freeze
  s.version = "0.2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Tomasz Stachewicz".freeze, "Wojciech Pietrzak".freeze, "Steve Verlinden".freeze, "Robert Pankowecki".freeze, "Chris Salzberg".freeze]
  s.date = "2015-05-15"
  s.description = "Define methods for accessing translated attributes".freeze
  s.email = ["tomekrs@o2.pl".freeze, "steve.verlinden@gmail.com".freeze, "robert.pankowecki@gmail.com".freeze, "rpa@gavdi.com".freeze, "chrissalzberg@gmail.com".freeze]
  s.homepage = "http://rubygems.org/gems/globalize-accessors".freeze
  s.rubyforge_project = "globalize-accessors".freeze
  s.rubygems_version = "2.7.6.2".freeze
  s.summary = "Define methods for accessing translated attributes".freeze

  s.installed_by_version = "2.7.6.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<globalize>.freeze, [">= 5.0.0", "~> 5.0"])
      s.add_development_dependency(%q<sqlite3>.freeze, [">= 0"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
      s.add_development_dependency(%q<minitest>.freeze, ["~> 5.1"])
    else
      s.add_dependency(%q<globalize>.freeze, [">= 5.0.0", "~> 5.0"])
      s.add_dependency(%q<sqlite3>.freeze, [">= 0"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
      s.add_dependency(%q<minitest>.freeze, ["~> 5.1"])
    end
  else
    s.add_dependency(%q<globalize>.freeze, [">= 5.0.0", "~> 5.0"])
    s.add_dependency(%q<sqlite3>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<minitest>.freeze, ["~> 5.1"])
  end
end
