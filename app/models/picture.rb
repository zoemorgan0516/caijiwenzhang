class Picture
  include Mongoid::Document
  include Mongoid::Timestamps

  mount_uploader :image, AvatarUploader


  belongs_to :article

end
