class Post < ActiveRecord::Base
	# create some validations here that ensure both our attributes
	# are present when a user creates or edits a post
	validates :title, :bru_name, :body, presence: true
	validates :title, uniqueness: true
end
