class PostsController < ApplicationController
	before_action :find_post_id, only: [:show, :edit, :update, :destroy]

	def index
	end

	def new
		@post = Post.new
		
	end

	def create
		@post = Post.new post_params
		if @post.save
			redirect_to @post, notice: "Article SAVED"
		else
			render 'new', notice: "Article UNSAVED"
		end
	end

	def show
		
	end

	def edit
		
	end

	def update
		if @post.update post_params
			redirect_to @post, notice: "Done Update!"
		else
			render 'edit'
		end
	end

	def destroy
		@post.destroy
		redirect_to posts_path
	end

	private
	def post_params
		params.required(:post).permit(:title, :content)
	end

	def find_post_id
		@post = Post.find(params[:id])
	end
end
