
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "snow_report/version"

Gem::Specification.new do |spec|
  spec.name          = "snow_report"
  spec.version       = SnowReport::VERSION
  spec.authors       = ["thurman024"]
  spec.email         = ["33437392+thurman024@users.noreply.github.com"]

  spec.summary       = "Provides snow condition data for various US ski resorts"
  spec.homepage      = "https://github.com/thurman024/snow_report"
  spec.license       = "MIT"

  spec.files         = ["lib/snow_report.rb", "lib/snow_report/cli.rb", "lib/snow_report/mountains.rb", "lib/snow_report/scraper.rb"]
  spec.bindir        = "bin"
  spec.executables   << "snow-report"
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"

  spec.add_dependency "nokogiri"

end
