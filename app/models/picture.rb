class Picture
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String

  mount_uploader :avatar, AvatarUploader


  has_and_belongs_to_many :articles

end
