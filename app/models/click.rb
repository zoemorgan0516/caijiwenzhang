class Click
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :article

end
