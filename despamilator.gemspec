# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'despamilator/version'

Gem::Specification.new do |s|
  s.name        = 'despamilator'
  s.version     = Despamilator::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Stephen Hardisty']
  s.email       = ['moowahaha@hotmail.com']
  s.homepage    = 'http://github.com/moowahaha/despamilator'
  s.summary     = %q{Stop web form Spam!}
  s.description = %q{Despamilator is a plugin based spam detector designed for use on your web forms borne out of two annoyances: Spam being submitted in my web forms and CAPTCHAS being intrusive. Despamilator will apply some commonly used heuristics from the world of anti-spam to help you decide whether your users are human or machine.}

  s.required_rubygems_version = '>= 1.3.5'
  s.rubyforge_project         = 'despamilator'

  s.add_dependency 'domainatrix'

  s.files        = Dir.glob('{bin,lib}/**/*') + %w(README.rdoc History.txt)
  s.require_path = 'lib'
end