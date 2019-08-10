if ENV['COV']
  require 'simplecov'
  SimpleCov.start 'rails'
end

ENV["RAILS_ENV"] = "test"

puts `cd #{__dir__}/dummy && RAILS_ENV=test bin/rake db:migrate`
exit $?.exitstatus unless $?.success?

require File.expand_path("../dummy/config/environment.rb",  __FILE__)
require "rails/test_help"
require "rspec/rails"
require "capybara/rspec"

Rails.backtrace_cleaner.remove_silencers!

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

RSpec.configure do |config|
  require 'rspec/expectations'
  config.include RSpec::Matchers

  config.mock_with :rspec
end
