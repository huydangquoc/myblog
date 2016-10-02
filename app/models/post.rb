class Post < ActiveRecord::Base
	is_impressionable

	validates :title, presence: true
	validates :body, presence: true
	validates :title, length: { minimum: 5 }
	validates :body, length: { minimum: 20 }

	has_many :comments

	def self.search(search_term)
		if search_term
			@posts = Post.where("title LIKE ?", "%#{search_term}%")
		else
			@posts = Post.all.order("created_at DESC")
		end
	end
end
