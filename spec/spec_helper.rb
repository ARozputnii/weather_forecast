require "telegram/bot"
Dir[File.join("./lib/", "**/*.rb")].each { |f| require f }

RSpec.configure do |config|
  # TODO here need to setup mongo-db-cleaner
end
