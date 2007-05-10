require 'rubygems'
require 'rake'
require 'rake/clean'
require 'rake/testtask'
require 'rake/packagetask'
require 'rake/gempackagetask'
require 'rake/rdoctask'
require 'rake/contrib/rubyforgepublisher'
require 'fileutils'
require 'hoe'
include FileUtils
require File.join(File.dirname(__FILE__), 'lib', 'lorem', 'version')

AUTHOR = "John Nunemaker"  # can also be an array of Authors
EMAIL = "nunemaker@gmail.com"
DESCRIPTION = "Simple gem for generating lorem ipsum from the command line"
GEM_NAME = "lorem" # what ppl will type to install your gem
RUBYFORGE_PROJECT = "lorem" # The unix name for your project
HOMEPATH = "http://#{RUBYFORGE_PROJECT}.rubyforge.org"


NAME = "lorem"
REV = nil # UNCOMMENT IF REQUIRED: File.read(".svn/entries")[/committed-rev="(d+)"/, 1] rescue nil
VERS = ENV['VERSION'] || (Lorem::VERSION::STRING + (REV ? ".#{REV}" : ""))
                          CLEAN.include ['**/.*.sw?', '*.gem', '.config']
RDOC_OPTS = ['--quiet', '--title', "lorem documentation",
    "--opname", "index.html",
    "--line-numbers", 
    "--main", "README",
    "--inline-source"]

class Hoe
  def extra_deps 
    @extra_deps.reject { |x| Array(x).first == 'hoe' } 
  end 
end

# Generate all the Rake tasks
# Run 'rake -T' to see list of generated tasks (from gem root directory)
hoe = Hoe.new(GEM_NAME, VERS) do |p|
  p.author = AUTHOR 
  p.description = DESCRIPTION
  p.email = EMAIL
  p.summary = DESCRIPTION
  p.url = HOMEPATH
  p.rubyforge_name = RUBYFORGE_PROJECT if RUBYFORGE_PROJECT
  p.test_globs = ["test/**/*_test.rb"]
  p.clean_globs = CLEAN  #An array of file patterns to delete on clean.
  
  # == Optional
  #p.changes        - A description of the release's latest changes.
  #p.extra_deps     - An array of rubygem dependencies.
  #p.spec_extras    - A hash of extra values to set in the gemspec.
end

desc 'Upload website files to rubyforge'
task :website do
  config = YAML.load(File.read(File.expand_path("~/.rubyforge/user-config.yml")))
  host = "#{config["username"]}@rubyforge.org"
  remote_dir = "/var/www/gforge-projects/#{RUBYFORGE_PROJECT}/"
  # remote_dir = "/var/www/gforge-projects/#{RUBYFORGE_PROJECT}/#{GEM_NAME}"
  local_dir = 'website'
  sh %{rsync -av #{local_dir}/ #{host}:#{remote_dir}}
end

desc 'Release the website and new gem version'
task :deploy => [:check_version, :website, :release]

task :check_version do
  unless ENV['VERSION']
    puts 'Must pass a VERSION=x.y.z release version'
    exit
  end
  unless ENV['VERSION'] == VERS
    puts "Please update your version.rb to match the release version, currently #{VERS}"
    exit
  end
end