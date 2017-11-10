class Picture
  include Mongoid::Document
  include Mongoid::Timestamps
  field :image, type: File
  mount_uploader :image, AvatarUploader


  belongs_to :article

end
