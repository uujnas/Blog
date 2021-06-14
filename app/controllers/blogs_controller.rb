class BlogsController < ApplicationController
    def index
        @blog = Blog.order("created_at DESC")
        @q = Blog.ransack(params[:q])
        @blog = @q.result(distinct: true)
    end

    def new
        @blog = Blog.new
    end

    def show
        @blog = Blog.find(params[:id])
    end

    def create
        @blog=Blog.new(post_params)
        if @blog.save
            redirect_to root_path, notice:"Posted successfully"
        else
            render :new, alert:"Unable to post your blog"
        end
    end
    

    def edit
        @blog = Blog.find(params[:id])
    end

    def update
        @blog=Blog.find(params[:id])
        if @blog.update(post_params)
            redirect_to root_path, notice:"updated successfully"
        else
            render :edit, alert:"sorry unable to update"
        end
    end

    def destroy
        @blog=Blog.find(params[:id])
        @blog.destroy
        redirect_to root_path
    end


    private
    def post_params
        params.require(:blog).permit(:written_by,:profile_pic,:job_title,:title,:description, :content)
    end
end
