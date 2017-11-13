class Label
  include Mongoid::Document
  include Mongoid::Timestamps
    paginates_per 5
  field :name, type: String
  field :used_count, type: Integer
  field :active, type: Boolean

  has_and_belongs_to_many :articles


end
