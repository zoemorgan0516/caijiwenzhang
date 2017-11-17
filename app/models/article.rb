class Article
  include Mongoid::Document
  include Mongoid::Timestamps
  mount_uploader :avatar, AvatarUploader
  field :title, type: String
  field :content, type: String
  field :gonghao_name, type: String
  field :traffic, type: Integer
  field :label, type: Boolean

  has_and_belongs_to_many :labels, autosave: true
  belongs_to :user, index: true
  has_and_belongs_to_many :pictures
  has_many :clicks

  def traffic_add
    if self.clicks.create
      self.inc(traffic: 1)
      true
    end
  end


end
