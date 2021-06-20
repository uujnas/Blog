class CommentsController < ApplicationController
    before_action :set_blog
    before_action :authenticate_user!
    def create
        @comment =@blog.comments.new(create_params)
        @comment.user = current_user
        @comment.save
        redirect_to blogs_path
    end

    def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy
        redirect_to root_path
        
    end

    private
    def create_params
        params.require(:comment).permit(:body, :blog_id)
    end

    def set_blog
        @blog = Blog.find(params[:blog_id])
    end
end
