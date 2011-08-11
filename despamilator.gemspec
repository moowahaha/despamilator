# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{despamilator}
  s.version = "2.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Stephen Hardisty"]
  s.date = %q{2011-08-11}
  s.description = %q{Despamilator is a plugin based spam detector designed for use on your web forms borne out of two annoyances:
Spam being submitted in my web forms and CAPTCHAS being intrusive. Despamilator will apply
some commonly used heuristics from the world of anti-spam to help you decide whether your users are human or machine.}
  s.email = ["moowahaha@hotmail.com"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "PostInstall.txt", "conf/unusual_characters.txt"]
  s.files = [".rspec", ".rvmrc", "Gemfile", "Gemfile.lock", "History.txt", "Manifest.txt", "PostInstall.txt", "README.rdoc", "Rakefile", "conf/unusual_characters.txt", "despamilator.gemspec", "lib/despamilator.rb", "lib/despamilator/filter.rb", "lib/despamilator/filter/gtubs_test_filter.rb", "lib/despamilator/filter/html_tags.rb", "lib/despamilator/filter/ip_address_url.rb", "lib/despamilator/filter/long_words.rb", "lib/despamilator/filter/naughty_words.rb", "lib/despamilator/filter/numbers_and_words.rb", "lib/despamilator/filter/script_tag.rb", "lib/despamilator/filter/shouting.rb", "lib/despamilator/filter/square_brackets.rb", "lib/despamilator/filter/trailing_number.rb", "lib/despamilator/filter/unusual_characters.rb", "lib/despamilator/filter/urls.rb", "lib/despamilator/filter_base.rb", "scripts/despamilator_score.rb", "scripts/from_file.rb", "spec/despamilator_spec.rb", "spec/filter_base_spec.rb", "spec/filters/gtubs_test_filter_spec.rb", "spec/filters/html_tags_spec.rb", "spec/filters/ip_address_url_spec.rb", "spec/filters/long_words_spec.rb", "spec/filters/naughty_words_spec.rb", "spec/filters/numbers_and_words_spec.rb", "spec/filters/script_tag_spec.rb", "spec/filters/shouting_spec.rb", "spec/filters/square_brackets_spec.rb", "spec/filters/trailing_number_spec.rb", "spec/filters/unusual_characters_spec.rb", "spec/filters/urls_spec.rb", "spec/helpers/corpus_helper.rb", "spec/helpers/filter_helper.rb", "spec/helpers/spec_helper.rb", "tasks/test.rake"]
  s.homepage = %q{http://github.com/moowahaha/despamilator}
  s.post_install_message = %q{PostInstall.txt}
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{despamilator}
  s.rubygems_version = %q{1.5.2}
  s.summary = %q{Despamilator is a plugin based spam detector designed for use on your web forms borne out of two annoyances: Spam being submitted in my web forms and CAPTCHAS being intrusive}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rubyforge>, [">= 2.0.4"])
      s.add_development_dependency(%q<hoe>, [">= 2.7.0"])
    else
      s.add_dependency(%q<rubyforge>, [">= 2.0.4"])
      s.add_dependency(%q<hoe>, [">= 2.7.0"])
    end
  else
    s.add_dependency(%q<rubyforge>, [">= 2.0.4"])
    s.add_dependency(%q<hoe>, [">= 2.7.0"])
  end
end
