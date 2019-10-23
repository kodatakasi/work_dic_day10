class BlogsController < ApplicationController
  def new
    @blog = Blog.new
  end

  def create
   @blog = Blog.create(params[:blog])
   if @blog.save
     redirect_to blogs_path, notice: "ブログを作成しました！"
   else
     render :new
   end
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :content)
  end
end
