# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'access_lint/version'

Gem::Specification.new do |spec|
  spec.name          = "access_lint"
  spec.version       = AccessLint::VERSION
  spec.authors       = ["Cameron Cundiff"]
  spec.email         = ["ckundo@gmail.com"]
  spec.description   = %q{Run an accessibility audit on a file or URL from the command line.}
  spec.summary       = %q{AccessLint runs Google Accessibility Developer Tools assertions on a page via PhantomJS}
  spec.homepage      = "https://github.com/ckundo/access_lint"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.test_files    = spec.files.grep(%r{^spec/})
  spec.require_paths = ["lib"]
  spec.executables   = ['access_lint']

  `git submodule --quiet foreach pwd`.split($\).each do |submodule_path|
    Dir.chdir(submodule_path) do
      submodule_files = `git ls-files`.split($\)
      submodule_files_fullpaths = submodule_files.map do |filename|
        "#{submodule_path}/#{filename}"
      end
      submodule_files_paths = submodule_files_fullpaths.map do |filename|
        filename.gsub "#{File.dirname(__FILE__)}/", ""
      end
      spec.files += submodule_files_paths
    end
  end

  spec.add_dependency "thor"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
