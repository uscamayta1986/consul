# -*- encoding: utf-8 -*-
# stub: recipient_interceptor 0.2.0 ruby lib

Gem::Specification.new do |s|
  s.name = "recipient_interceptor".freeze
  s.version = "0.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Dan Croak".freeze]
  s.date = "2018-05-24"
  s.description = "    Use RecipientInterceptor when you don't want your Ruby program to\n    accidentally send emails to addresses other than those on a whitelist\n    which you configure. For example, you could use it in your web app's\n    staging environment.\n".freeze
  s.email = "dan@statusok.com".freeze
  s.homepage = "http://github.com/croaky/recipient_interceptor".freeze
  s.rubygems_version = "2.7.6.2".freeze
  s.summary = "Intercept recipients when delivering email with the Mail gem.".freeze

  s.installed_by_version = "2.7.6.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<mail>.freeze, [">= 0"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
      s.add_development_dependency(%q<rspec>.freeze, [">= 0"])
    else
      s.add_dependency(%q<mail>.freeze, [">= 0"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
      s.add_dependency(%q<rspec>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<mail>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, [">= 0"])
  end
end
