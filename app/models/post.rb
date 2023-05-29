class Post < ApplicationRecord
  validates :content, {presence: true}
  validates :user_id, {presence: true}

  def user
    return User.find_by(id: self.user_id)
  end

  def posts
    return Post.where(user_id: self.id)
  end

end