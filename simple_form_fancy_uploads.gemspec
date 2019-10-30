$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "simple_form_fancy_uploads/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "simple_form_fancy_uploads"
  s.version     = SimpleFormFancyUploads::VERSION
  s.authors     = ["Andrea Pavoni"]
  s.email       = ["andrea.pavoni@gmail.com"]
  s.homepage    = "http://github.com/apeacox/simple_form_fancy_uploads"
  s.summary     = "simple_form custom inputs to get image/link previews with file uploads."
  s.description = "Use simple_form (>= v2.0) custom inputs to get image previews or a link to uploaded file. Save time and code when you need useful file uploads."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails",       ">= 5.0"
  s.add_dependency "simple_form", ">= 4.1", "< 6.0"
  s.add_dependency "carrierwave", "~> 1.3"
end
