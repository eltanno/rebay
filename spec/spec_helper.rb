require 'bundler/setup'
require File.join(File.dirname(__FILE__), "..", "lib", "rebay")

Dir["./spec/support/**/*.rb"].sort.each {|f| require f}

RSpec.configure do |config|
  config.mock_with :rspec
end

Rebay::Api.configure do |rebay|
  rebay.app_id = 'Codesort-7d51-4677-a61d-80107e28bde6'
  # rebay.default_site_id = Rebay::Api::EBAY_GB
  rebay.sandbox = true
end