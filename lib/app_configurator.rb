require "yaml"
require "mongoid"

module AppConfigurator
  SECRETS_PATH = "./config/secrets.yml"

  def configure
    setup_database
  end

  def secret(key)
    YAML.load(IO.read(SECRETS_PATH))[key]
  end

  private
  def setup_database
    Mongoid.load!(File.join("config", "mongoid.yml"), :production)
  end
end
