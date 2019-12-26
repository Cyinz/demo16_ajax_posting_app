class Post < ApplicationRecord
  validates_presence_of :content

  belongs_to :user

  has_many :likes, :dependent => :destroy # 级联删除，删除用户时删除该用户所有的点赞
  has_many :liked_users, :through => :likes, :source => :user

  def find_like(user)
    self.likes.where(:user_id => user.id).first
  end
end
