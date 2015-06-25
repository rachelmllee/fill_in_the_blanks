class PostsController < ApplicationController
	# BONUS! Learn how to use a before_action to keep your controller DRY

	def index
		# create an instance variable that points to all of our posts
		@posts = Post.all
		# there are already some seeded posts, get them to show up in your app
	end

	def new
		# instantiate an empty (new) Post
		@post = Post.new
	end

	def create
		# create a Post and save it into the database
		@post = Post.new(post_params)
		# redirect to the new Post
		if @post.save
			redirect_to @post
		else
			render 'new'
		end
	end

	def show
		# assign an instance variable to the post with id from params
		@post = Post.find params[:id]
	end

	def edit
		# assign an instance variable to the post with id from params
		@post = Post.find params[:id]
	end

	def update
		# update the instance variable from our edit page
		@post = Post.find params[:id]
		# redirect to the updated post
		if @post.update(post_params)
			redirect_to @post
		else
			render 'edit'
		end
	end

	def destroy
		# assign an instance variable to the post with id from params
		@post = Post.find params[:id]
		# destroy the post
		@post.destroy
		# redirect to index
		redirect_to posts_path
	end

private
	def post_params
		# fill in with strong parameters
		params.require(:post).permit(:bru_name, :title, :body)
	end
end
