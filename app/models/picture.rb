class Picture
  include Mongoid::Document
  include Mongoid::Timestamps
  paginates_per 5
  mount_uploader :avatar, AvatarUploader

  belongs_to :article
  def get_ariticle_picture_url(article)
      Picture.create(remote_avatar_url: article.avatar_url) if article.avatar_url
  end
end
