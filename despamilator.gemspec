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
      s.add_dependency(%q<domainatrix>, [">= 0.0.10"])
    end
  else
    s.add_dependency(%q<rubyforge>, [">= 2.0.4"])
    s.add_dependency(%q<hoe>, [">= 2.7.0"])
    s.add_dependency(%q<domainatrix>, [">= 0.0.10"])
  end
end
