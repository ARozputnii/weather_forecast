require 'yaml'

module AppConfigurator
  SECRETS_PATH = './config/secrets.yml'

  def configure
    setup_database
  end

  def secret(key)
    YAML::load(IO.read(SECRETS_PATH))[key]
  end

  private

  def setup_database
    # TODO: setup DB
  end
end
