class Article < ActiveRecord::Base
	validates :text, presence: true
	validates :title, presence: true
	has_many :comments
	def subject
		title
	end
	def last_comment
		comments.last
	end
end
