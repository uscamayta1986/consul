# -*- encoding: utf-8 -*-
# stub: knapsack_pro 2.6.0 ruby lib

Gem::Specification.new do |s|
  s.name = "knapsack_pro".freeze
  s.version = "2.6.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "bug_tracker_uri" => "https://github.com/KnapsackPro/knapsack_pro-ruby/issues", "changelog_uri" => "https://github.com/KnapsackPro/knapsack_pro-ruby/blob/master/CHANGELOG.md", "documentation_uri" => "https://docs.knapsackpro.com/integration/", "homepage_uri" => "https://knapsackpro.com", "source_code_uri" => "https://github.com/KnapsackPro/knapsack_pro-ruby" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["ArturT".freeze]
  s.date = "2020-09-23"
  s.description = "Run tests in parallel across CI server nodes based on tests execution time. Split tests in a dynamic way to ensure parallel jobs are done at a similar time. Thanks to that your CI build time is as fast as possible. It works with many CI providers.".freeze
  s.email = ["arturtrzop@gmail.com".freeze]
  s.executables = ["knapsack_pro".freeze]
  s.files = ["bin/knapsack_pro".freeze]
  s.homepage = "https://knapsackpro.com".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.7.6.2".freeze
  s.summary = "Knapsack Pro splits tests across parallel CI nodes and ensures each parallel job finish work at a similar time.".freeze

  s.installed_by_version = "2.7.6.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rake>.freeze, [">= 0"])
      s.add_development_dependency(%q<bundler>.freeze, [">= 1.6"])
      s.add_development_dependency(%q<rspec>.freeze, [">= 2.10.0", "~> 3.0"])
      s.add_development_dependency(%q<rspec-its>.freeze, ["~> 1.2"])
      s.add_development_dependency(%q<cucumber>.freeze, [">= 0"])
      s.add_development_dependency(%q<spinach>.freeze, [">= 0.8"])
      s.add_development_dependency(%q<minitest>.freeze, [">= 5.0.0"])
      s.add_development_dependency(%q<test-unit>.freeze, [">= 3.0.0"])
      s.add_development_dependency(%q<codeclimate-test-reporter>.freeze, ["~> 0"])
      s.add_development_dependency(%q<pry>.freeze, ["~> 0"])
      s.add_development_dependency(%q<vcr>.freeze, ["~> 2.9"])
      s.add_development_dependency(%q<webmock>.freeze, ["~> 1.21"])
      s.add_development_dependency(%q<timecop>.freeze, [">= 0.1.0"])
    else
      s.add_dependency(%q<rake>.freeze, [">= 0"])
      s.add_dependency(%q<bundler>.freeze, [">= 1.6"])
      s.add_dependency(%q<rspec>.freeze, [">= 2.10.0", "~> 3.0"])
      s.add_dependency(%q<rspec-its>.freeze, ["~> 1.2"])
      s.add_dependency(%q<cucumber>.freeze, [">= 0"])
      s.add_dependency(%q<spinach>.freeze, [">= 0.8"])
      s.add_dependency(%q<minitest>.freeze, [">= 5.0.0"])
      s.add_dependency(%q<test-unit>.freeze, [">= 3.0.0"])
      s.add_dependency(%q<codeclimate-test-reporter>.freeze, ["~> 0"])
      s.add_dependency(%q<pry>.freeze, ["~> 0"])
      s.add_dependency(%q<vcr>.freeze, ["~> 2.9"])
      s.add_dependency(%q<webmock>.freeze, ["~> 1.21"])
      s.add_dependency(%q<timecop>.freeze, [">= 0.1.0"])
    end
  else
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<bundler>.freeze, [">= 1.6"])
    s.add_dependency(%q<rspec>.freeze, [">= 2.10.0", "~> 3.0"])
    s.add_dependency(%q<rspec-its>.freeze, ["~> 1.2"])
    s.add_dependency(%q<cucumber>.freeze, [">= 0"])
    s.add_dependency(%q<spinach>.freeze, [">= 0.8"])
    s.add_dependency(%q<minitest>.freeze, [">= 5.0.0"])
    s.add_dependency(%q<test-unit>.freeze, [">= 3.0.0"])
    s.add_dependency(%q<codeclimate-test-reporter>.freeze, ["~> 0"])
    s.add_dependency(%q<pry>.freeze, ["~> 0"])
    s.add_dependency(%q<vcr>.freeze, ["~> 2.9"])
    s.add_dependency(%q<webmock>.freeze, ["~> 1.21"])
    s.add_dependency(%q<timecop>.freeze, [">= 0.1.0"])
  end
end
