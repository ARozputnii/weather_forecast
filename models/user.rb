class User
  include Mongoid::Document
  include Mongoid::Timestamps

  field :chat_id, type: String
end
