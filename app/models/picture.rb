class Picture
  include Mongoid::Document
  include Mongoid::Timestamps

  mount_uploader :avatar, AvatarUploader
  
  belongs_to :article

end
