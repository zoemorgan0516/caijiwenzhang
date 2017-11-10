class Article
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String
  field :content, type: String
  field :gonghao_name, type: String
  field :traffic, type: Integer
  field :label, type: Boolean
  field :image, type: String

  mount_uploader :image, AvatarUploader


  has_and_belongs_to_many :labels, autosave: true
  belongs_to :user, index: true


end
