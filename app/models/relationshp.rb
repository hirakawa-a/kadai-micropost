class Relationshp < ApplicationRecord
  belongs_to :user
  belongs_to :follow, class_ame: 'User'
  
  validates :user_id, presence: true
  validates :follow_id, presence: true
end
