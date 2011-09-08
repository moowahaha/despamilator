# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{despamilator}
  s.version = "2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = [%q{Stephen Hardisty}]
  s.date = %q{2011-09-08}
  s.description = %q{Despamilator is a plugin based spam detector designed for use on your web forms borne out of two annoyances:
Spam being submitted in my web forms and CAPTCHAS being intrusive. Despamilator will apply
some commonly used heuristics from the world of anti-spam to help you decide whether your users are human or machine.}
  s.email = [%q{moowahaha@hotmail.com}]
  s.extra_rdoc_files = [%q{History.txt}, %q{Manifest.txt}, %q{PostInstall.txt}, %q{conf/unusual_characters.txt}]
  s.files = [%q{.rspec}, %q{.rvmrc}, %q{Gemfile}, %q{Gemfile.lock}, %q{History.txt}, %q{Manifest.txt}, %q{PostInstall.txt}, %q{README.rdoc}, %q{Rakefile}, %q{conf/unusual_characters.txt}, %q{despamilator.gemspec}, %q{lib/despamilator.rb}, %q{lib/despamilator/filter.rb}, %q{lib/despamilator/filter/gtubs_test_filter.rb}, %q{lib/despamilator/filter/html_tags.rb}, %q{lib/despamilator/filter/ip_address_url.rb}, %q{lib/despamilator/filter/long_words.rb}, %q{lib/despamilator/filter/naughty_words.rb}, %q{lib/despamilator/filter/numbers_and_words.rb}, %q{lib/despamilator/filter/script_tag.rb}, %q{lib/despamilator/filter/shouting.rb}, %q{lib/despamilator/filter/square_brackets.rb}, %q{lib/despamilator/filter/trailing_number.rb}, %q{lib/despamilator/filter/unusual_characters.rb}, %q{lib/despamilator/filter/urls.rb}, %q{lib/despamilator/filter_base.rb}, %q{scripts/despamilator_score.rb}, %q{scripts/from_file.rb}, %q{spec/despamilator_spec.rb}, %q{spec/filter_base_spec.rb}, %q{spec/filters/gtubs_test_filter_spec.rb}, %q{spec/filters/html_tags_spec.rb}, %q{spec/filters/ip_address_url_spec.rb}, %q{spec/filters/long_words_spec.rb}, %q{spec/filters/naughty_words_spec.rb}, %q{spec/filters/numbers_and_words_spec.rb}, %q{spec/filters/script_tag_spec.rb}, %q{spec/filters/shouting_spec.rb}, %q{spec/filters/square_brackets_spec.rb}, %q{spec/filters/trailing_number_spec.rb}, %q{spec/filters/unusual_characters_spec.rb}, %q{spec/filters/urls_spec.rb}, %q{spec/helpers/corpus_helper.rb}, %q{spec/helpers/filter_helper.rb}, %q{spec/helpers/spec_helper.rb}, %q{tasks/test.rake}]
  s.homepage = %q{http://github.com/moowahaha/despamilator}
  s.post_install_message = %q{PostInstall.txt}
  s.rdoc_options = [%q{--main}, %q{README.rdoc}]
  s.require_paths = [%q{lib}]
  s.rubyforge_project = %q{despamilator}
  s.rubygems_version = %q{1.8.6}
  s.summary = %q{Despamilator is a plugin based spam detector designed for use on your web forms borne out of two annoyances: Spam being submitted in my web forms and CAPTCHAS being intrusive}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rubyforge>, [">= 2.0.4"])
      s.add_development_dependency(%q<hoe>, [">= 2.7.0"])
    else
      s.add_dependency(%q<rubyforge>, [">= 2.0.4"])
      s.add_dependency(%q<hoe>, [">= 2.7.0"])
      s.add_dependency(%q<domainatrix>, ['>= 0.0.10'])
    end
  else
    s.add_dependency(%q<rubyforge>, [">= 2.0.4"])
    s.add_dependency(%q<hoe>, [">= 2.7.0"])
    s.add_dependency(%q<domainatrix>, ['>= 0.0.10'])
  end
end
