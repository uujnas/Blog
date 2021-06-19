class BlogsController < ApplicationController
      before_action :authenticate_user!, except: [:index, :show]  

    def index
        @category = Category.all
        @blogs = Blog.all.order("created_at DESC").paginate(page: params[:page],per_page:3)
        @q = Blog.ransack(params[:q])
        @blog = @q.result(distinct: true)
    end

    def new
        @blog = current_user.blogs.build
    end

    def show
        @blog = Blog.find(params[:id])
        # byebug
    end

    def create
        @blog=current_user.blogs.build(post_params)
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

    # def correct_user
    #     @blog = current_user.blogs.find_by(id:params[:id])
    #     redirect_to blogs_path, notice: "Not authorized to edit" if @blog.nl?
    # end

    def destroy
        @blog=Blog.find(params[:id])
        @blog.destroy
        redirect_to root_path
    end


    private
    def post_params
        params.require(:blog).permit(:written_by,:profile_pic,:job_title,:title,:description, :content, :category_id,:user_id)
    end
end
