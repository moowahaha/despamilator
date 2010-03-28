# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{despamilator}
  s.version = "0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Stephen Hardisty"]
  s.date = %q{2010-03-28}
  s.description = %q{Despamilator is a plugin based spam detector designed for use on your web forms borne out of two annoyances:
Spam being submitted in my web forms AND CAPTCHAS being intrusive. Despamilator will apply
some commonly used heuristics from the world of anti-spam to help you decide whether your users are human or machine.}
  s.email = ["moowahaha@hotmail.com"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "PostInstall.txt", "pkg/despamilator-0.1/History.txt", "pkg/despamilator-0.1/Manifest.txt", "pkg/despamilator-0.1/PostInstall.txt"]
  s.files = ["History.txt", "Manifest.txt", "PostInstall.txt", "README.rdoc", "Rakefile", "despamilator.gemspec", "lib/despamilator.rb", "lib/despamilator/filter.rb", "lib/despamilator/filter/html_tags.rb", "lib/despamilator/filter/naughty_q.rb", "lib/despamilator/filter/numbers_and_words.rb", "lib/despamilator/filter/script_tag.rb", "lib/despamilator/filter_base.rb", "pkg/despamilator-0.1.gem", "pkg/despamilator-0.1.tgz", "pkg/despamilator-0.1/History.txt", "pkg/despamilator-0.1/Manifest.txt", "pkg/despamilator-0.1/PostInstall.txt", "pkg/despamilator-0.1/README.rdoc", "pkg/despamilator-0.1/Rakefile", "pkg/despamilator-0.1/despamilator.gemspec", "pkg/despamilator-0.1/lib/despamilator.rb", "pkg/despamilator-0.1/lib/despamilator/filter.rb", "pkg/despamilator-0.1/lib/despamilator/filter/html_tags.rb", "pkg/despamilator-0.1/lib/despamilator/filter/naughty_q.rb", "pkg/despamilator-0.1/lib/despamilator/filter/numbers_and_words.rb", "pkg/despamilator-0.1/lib/despamilator/filter/script_tag.rb", "pkg/despamilator-0.1/lib/despamilator/filter_base.rb", "pkg/despamilator-0.1/spec/despamilator_spec.rb", "pkg/despamilator-0.1/spec/filters/html_tags_spec.rb", "pkg/despamilator-0.1/spec/filters/naughty_q_spec.rb", "pkg/despamilator-0.1/spec/filters/numbers_and_words_spec.rb", "pkg/despamilator-0.1/spec/filters/script_tag_spec.rb", "pkg/despamilator-0.1/spec/spec.opts", "pkg/despamilator-0.1/spec/spec_helper.rb", "pkg/despamilator-0.1/tasks/rspec.rake", "spec/despamilator_spec.rb", "spec/filters/html_tags_spec.rb", "spec/filters/naughty_q_spec.rb", "spec/filters/numbers_and_words_spec.rb", "spec/filters/script_tag_spec.rb", "spec/spec.opts", "spec/spec_helper.rb", "tasks/rspec.rake"]
  s.homepage = %q{http://github.com/moowahaha/despamliator}
  s.post_install_message = %q{PostInstall.txt}
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{despamilator}
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{Despamilator is a plugin based spam detector designed for use on your web forms borne out of two annoyances: Spam being submitted in my web forms AND CAPTCHAS being intrusive}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rubyforge>, [">= 2.0.3"])
      s.add_development_dependency(%q<gemcutter>, [">= 0.5.0"])
      s.add_development_dependency(%q<hoe>, [">= 2.5.0"])
    else
      s.add_dependency(%q<rubyforge>, [">= 2.0.3"])
      s.add_dependency(%q<gemcutter>, [">= 0.5.0"])
      s.add_dependency(%q<hoe>, [">= 2.5.0"])
    end
  else
    s.add_dependency(%q<rubyforge>, [">= 2.0.3"])
    s.add_dependency(%q<gemcutter>, [">= 0.5.0"])
    s.add_dependency(%q<hoe>, [">= 2.5.0"])
  end
end
