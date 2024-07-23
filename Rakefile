require 'rubygems'
gem 'hoe', '>= 2.1.0'
require 'hoe'
require 'fileutils'
require './lib/despamilator'

Hoe.plugin :newgem
# Hoe.plugin :website
# Hoe.plugin :cucumberfeatures

# Generate all the Rake tasks
# Run 'rake -T' to see list of generated tasks (from gem root directory)
$hoe = Hoe.spec 'despamilator' do
  self.version = Despamilator::VERSION
  self.developer 'Stephen Hardisty', 'moowahaha@hotmail.com'
  self.post_install_message = 'PostInstall.txt'
end

Dir['tasks/**/*.rake'].each { |t| load t }

desc "Run all unit and corpus tests"
task :test => [:spec]

task :default => [:test]
task :install => [:install_gem]

desc 'Generate relevant documentation.'
task :rdoc do
  sh 'rdoc lib/despamilator.rb lib/despamilator/filter_base.rb'
end

namespace :test do
  desc 'Check syntax only'
  task :syntax do
    Dir.glob(File.join(File.dirname(__FILE__), 'lib', '**', '*.rb')).each do |file|
      sh "ruby -c #{file}"
    end
  end

  namespace :syntax do
    desc 'Run syntax checks for Ruby 1.8.7'
    task :ruby18 do
      sh 'rvm --create use 1.8.7@despamilator exec "rake test:syntax"'
    end
  end
end

task :cultivate do
  sh 'touch Manifest.txt; rake check_manifest |grep -v "(in " | patch'
  sh 'cat Manifest.txt  | grep -v "bundle/config" | grep -v "_corpus" > Manifest.txt2'
  sh 'mv Manifest.txt2 Manifest.txt'
  sh 'rake debug_gem | grep -v "(in " > `basename \\`pwd\\``.gemspec'
end
