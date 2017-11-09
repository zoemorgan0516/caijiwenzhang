class Comment
  include Mongoid::Document
  field :nickname, type: String
  field :msg, type: String
  embedded_in :post, counter_cache: true
end
