require_relative "buttons/abstract"
require_relative "buttons/settings"
require_relative "buttons/reload_location"
require_relative "buttons/set_time"

module Bot
  module Settings
    STRUCTURE = {
      # bla_1: %i[bla_1],
      # bla_2: {
      #   bla_3: %i[bla_5 bla_4],
      #   bla_4: %i[bla_4 bla_5],
      # },
      settings: {
        reload_location: :execute,
        set_time:        :force_reply,
      }
    }.freeze

    AVAILABLE_BUTTONS = {
      settings:        Bot::Buttons::Settings,
      reload_location: Bot::Buttons::ReloadLocation,
      set_time:        Bot::Buttons::SetTime,
    }.freeze
  end
end
