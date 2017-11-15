class Message
  include Mongoid::Document

  field :sender_id,    type: String
  field :content,   type: String





end
