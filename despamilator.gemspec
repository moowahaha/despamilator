# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{despamilator}
  s.version = "1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Stephen Hardisty"]
  s.date = %q{2010-12-11}
  s.description = %q{Despamilator is a plugin based spam detector designed for use on your web forms borne out of two annoyances:
Spam being submitted in my web forms and CAPTCHAS being intrusive. Despamilator will apply
some commonly used heuristics from the world of anti-spam to help you decide whether your users are human or machine.}
  s.email = ["moowahaha@hotmail.com"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "PostInstall.txt"]
  s.files = [".rspec", ".rvmrc", "Gemfile", "Gemfile.lock", "History.txt", "Manifest.txt", "PostInstall.txt", "README.rdoc", "Rakefile", "despamilator.gemspec", "lib/despamilator.rb", "lib/despamilator/filter.rb", "lib/despamilator/filter/funky_consonant.rb", "lib/despamilator/filter/html_tags.rb", "lib/despamilator/filter/ip_address_url.rb", "lib/despamilator/filter/long_words.rb", "lib/despamilator/filter/naughty_q.rb", "lib/despamilator/filter/naughty_words.rb", "lib/despamilator/filter/numbers_and_words.rb", "lib/despamilator/filter/script_tag.rb", "lib/despamilator/filter/shouting.rb", "lib/despamilator/filter/square_brackets.rb", "lib/despamilator/filter/urls.rb", "lib/despamilator/filter_base.rb", "scripts/despamilator_score.rb", "spec/despamilator_spec.rb", "spec/filter_base_spec.rb", "spec/filters/funky_consonant_spec.rb", "spec/filters/html_tags_spec.rb", "spec/filters/ip_address_url_spec.rb", "spec/filters/long_words_spec.rb", "spec/filters/naughty_q_spec.rb", "spec/filters/naughty_words_spec.rb", "spec/filters/numbers_and_words_spec.rb", "spec/filters/script_tag_spec.rb", "spec/filters/shouting_spec.rb", "spec/filters/square_brackets_spec.rb", "spec/filters/urls_spec.rb", "spec/helpers/corpus_helper.rb", "spec/helpers/filter_helper.rb", "spec/helpers/spec_helper.rb", "tasks/test.rake"]
  s.homepage = %q{http://github.com/moowahaha/despamilator}
  s.post_install_message = %q{PostInstall.txt}
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{despamilator}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Despamilator is a plugin based spam detector designed for use on your web forms borne out of two annoyances: Spam being submitted in my web forms and CAPTCHAS being intrusive}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<hoe>, [">= 2.7.0"])
    else
      s.add_dependency(%q<hoe>, [">= 2.7.0"])
    end
  else
    s.add_dependency(%q<hoe>, [">= 2.7.0"])
  end
end
