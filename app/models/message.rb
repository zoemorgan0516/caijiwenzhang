class Message
  include Mongoid::Document
  include Mongoid::Timestamps
  field :sender_id,    type: String
  field :content,   type: String
  field :status, type: Boolean, default: false

  def unread
    self.where(status: false).count
  end



end
