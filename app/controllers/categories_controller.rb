class CategoriesController < ApplicationController
    
  def index
    @category = Category.all
end

def new
    @category = Category.new
end

def show
    @category = Category.find(params[:id])
    puts "TEST"
    puts @category
 puts   "TEST"
end

def create
    @category=Category.new(post_params)
    if @category.save
        redirect_to categories_path, notice:"Posted successfully"
    else
        render :new, alert:"Unable to post your category"
    end
end


def edit
    @category = Category.find(params[:id])
end

def update
    @category=Category.find(params[:id])
    if @category.update(post_params)
        redirect_to categories_path, notice:"updated successfully"
    else
        render :edit, alert:"sorry unable to update"
    end
end

def destroy
    @category=Category.find(params[:id])
    @category.destroy
    redirect_to categories_path
end


private
def post_params
    params.require(:category).permit(:categories)
end
end
