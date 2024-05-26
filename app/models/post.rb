class Post < ApplicationRecord
  validates :user_id, presence: true
  validates :content, presence: true
  validates :title, length: { maximum: 40 }, presence: true

  def user
    return User.find_by(id: self.user_id)
  end

  def posts
    return Post.where(user_id: self.id)
  end

end