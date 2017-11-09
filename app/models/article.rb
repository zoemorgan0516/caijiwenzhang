class Article
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String
  field :content, type: String
  field :gonghao_name, type: String
  field :traffic, type: Integer
  field :label, type: Boolean


  has_and_belongs_to_many :labels
  belongs_to :user, index: true
  has_many :pictures

end
