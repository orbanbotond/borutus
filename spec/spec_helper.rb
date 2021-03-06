require "coveralls"
Coveralls.wear!

require "pry"

ENV["RAILS_ENV"] ||= "test"

require File.expand_path(
  File.dirname(__FILE__) + "/../fixture_rails_root/config/environment",
)
require Rails.root.join("db/schema").to_s

require "rspec/rails"

$LOAD_PATH << File.expand_path(File.dirname(__FILE__) + "/../lib/")

require "borutus"
require "kaminari"

Dir[
  File.expand_path(
    File.join(File.dirname(__FILE__), "support", "**", "*.rb"),
  )
].each do |f|
  require f
end

require "factory_bot"

borutus_definitions = File.expand_path(
  File.join(File.dirname(__FILE__), "factories"),
)
FactoryBot.definition_file_paths << borutus_definitions

RSpec.configure do |config|
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
end

FactoryBotHelpers.reload
