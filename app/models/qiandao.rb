class Qiandao
  include Mongoid::Document
  include Mongoid::Timestamps

  field :score, type: Integer
  field :type,  type: Integer, default: '用户签到'


  belongs_to :user



end
