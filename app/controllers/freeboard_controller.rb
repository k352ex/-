class FreeboardController < ApplicationController
  before_action :authenticate_user!

	def index
    @post = Post.all.order('created_at DESC').page(params[:page]).per(5)
	end

	def show
		@post = Post.find(params[:id])
    @comment = Comment.all
    @comments = Comment.new
    @user = User.all
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		@post.user_id = params[:user_id]
    @post.author = params[:author]
    @post.post_flag = params[:post_flag]

		if @post.save
			flash[:notice] = "글이 작성되었습니다."
			redirect_to freeboard_path(@post)
		else
			flash[:alert] = '실패'
			render 'new'
		end
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])

 		if @post.update(post_params)
	 		redirect_to @post
 		else
	 		render 'edit'
 		end
	end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to notice_index_path
  end

	private

	def post_params
		params.require(:post).permit(:title, :content, :author)
	end

end
