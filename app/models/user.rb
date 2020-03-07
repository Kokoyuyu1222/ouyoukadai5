class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable,:validatable

  attachment :profile_image
  attachment :image

  #バリデーションは該当するモデルに設定する。エラーにする条件を設定できる。
  validates :name, presence: true, length: {maximum: 20, minimum: 2}
  validates :introduction,length: { maximum: 50 }
  has_many :books,dependent: :destroy


  # def self.search_for(content,user)
  #   if method == "forward_match"
  #     @users = User.where("text LIKE?","#{content}%")
  #   elsif method == "backward_match"
  #     @users = User.where("text LIKE?","%#{content}")
  #   elsif method == "perfect_match"
  #     @users = User.where("#{content}")
  #   elsif method == "partial_match"
  #     @users = User.where("text LIKE?","%#{content}%")
  #   else
  #     @users = User.all
  #   end
  # end
end
