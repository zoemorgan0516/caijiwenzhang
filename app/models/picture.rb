class Picture
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String

  mount_uploader :avatar, AvatarUploader


  belongs_to :articles

end
