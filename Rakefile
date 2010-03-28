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
  self.developer 'Stephen Hardisty', 'moowahaha@hotmail.com'
  self.post_install_message = 'PostInstall.txt'
  self.rubyforge_name       = self.name # TODO this is default value
  # self.extra_deps         = [['activesupport','>= 2.0.2']]

end

require 'newgem/tasks'
Dir['tasks/**/*.rake'].each { |t| load t }

# TODO - want other tests/tasks run by default? Add them to the list
# remove_task :default
task :test => [:spec]
task :default => [:test]
task :install => [:install_gem]

task :cultivate do
  system "touch Manifest.txt; rake check_manifest | grep -v \"(in \" | patch"
  system "rake debug_gem | grep -v \"(in \" > `basename \\`pwd\\``.gemspec"
end