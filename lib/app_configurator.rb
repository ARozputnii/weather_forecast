require 'yaml'

class AppConfigurator
  SECRETS_PATH = './config/secrets.yml'

  def configure
    setup_database
  end

  def get_token
    YAML::load(IO.read(SECRETS_PATH))['telegram_bot_token']
  end

  private

  def setup_database
    # TODO: setup DB
  end
end