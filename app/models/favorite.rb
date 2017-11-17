class Favorite
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :article
  belongs_to :user


end
