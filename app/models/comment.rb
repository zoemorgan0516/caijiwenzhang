class Comment
  include Mongoid::Document
  include Mongoid::Timestamps

  field :speaker_name, type: String
  field :text, type: String



  embedded_in :article
  belongs_to :user

end
