class Post
  include Mongoid::Document
  field :title, type: String
  field :content, type: String
  field :comments_count, type: Integer
  embeds_many :comments











end
