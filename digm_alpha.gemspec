# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'digm_alpha/version'

Gem::Specification.new do |gem|
  gem.name          = "digm_alpha"
  gem.version       = DigmAlpha::VERSION
  gem.authors       = ["Anthony Cook"]
  gem.email         = ["anthonymichaelcook@gmail.com"]
  gem.description   = %q{(para)digm Alpha is the first language experiment of many leading to a hypothetical ideal.}
  gem.summary       = %q{(para)digm Alpha: a language experiment}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  %w{treetop activesupport}.each do |lib|
    gem.add_runtime_dependency lib
  end

  %w{
    rspec guard-rspec pry pry-nav pry-doc pry-theme pry-coolline pry-highlight pry-buffers
  }.each do |lib|
    gem.add_development_dependency lib
  end
end
