class Tuku
  include Mongoid::Document
  include Mongoid::Document

  mount_uploader :avatar, AvatarUploader

  has_and_belongs_to_many :articles


end
