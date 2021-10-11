require "yaml"
require 'bundler/setup'
Bundler.require

module AppConfigurator
  SECRETS_PATH = "./config/secrets.yml"

  def configure
    setup_database
    setup_sidekiq
  end

  def secret(key)
    YAML.load(IO.read(SECRETS_PATH))[key]
  end

  private
  def setup_database
    Mongoid.load!(File.join('config', 'mongoid.yml'), :production)
  end

  def setup_sidekiq
    require './bin/sidekiq_boot.rb'
  end
end
# Dir["/initializers/*.rb"].each {|file| require file }