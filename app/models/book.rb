class Book < ApplicationRecord
	belongs_to :user
	#バリデーションは該当するモデルに設定する。エラーにする条件を設定できる。
	#presence trueは空欄の場合を意味する。
	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 200}

	def user
		return User.find_by(id: self.user_id)
	end

	# def self.search(method,word)
	# 	if method == "forward_match"
	# 		@books = Book.where("text LIKE?","#{word}%")
	# 	elsif method == "backward_match"
	# 		@books = Book.where("text LIKE?","%#{word}")
	# 	elsif method == "perfect_match"
	# 		@books = Book.where("#{word}")
	# 	elsif method == "partial_match"
	# 		@books = Book.where("text LIKE?","%#{word}%")
	# 	else
	# 		@books = Book.all
	# 	end

	# end
end
