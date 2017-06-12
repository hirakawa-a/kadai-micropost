class Micropost < ApplicationRecord
  belongs_to :user
  
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 255}
  
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  
  def favorite(micropost)
      self.favorites.find_or_create_by(micropost_id: microposts.id)
  end

  def unfavorite!(micropost)
      favorite = favorites.find_by(micropost_id: microposts.id)
      favorite.destory if favorite
  end

  def favorite?(microposts)
     self.favorite_microposts.include?(microposts)
  end
end


