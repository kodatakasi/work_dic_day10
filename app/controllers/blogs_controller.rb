class BlogsController < ApplicationController



    before_action :set_blog, only: [:show, :edit, :update, :destroy]

    def index
      @blogs = Blog.all
    end

    def show
    end


    def edit
    end


    def update
        respond_to do |format|
          if @blog.update(blog_params)
            format.html { redirect_to @blog, notice: 'blog was successfully updated.' }
            format.json { render :show, status: :ok, location: @blog }
          else
            format.html { render :edit }
            format.json { render json: @blog.errors, status: :unprocessable_entity }
          end
        end
      end

    def destroy
        @blog.destroy
        redirect_to blogs_path
      end




  def new
    @blog = Blog.new
  end

  def create
   @blog = Blog.new(blog_params)
   if @blog.save
     redirect_to blogs_path, notice: "ブログを作成しました！"
   else
     render :new
   end
 end

  private
    def set_blog
      @blog = Blog.find(params[:id])
    end

    def blog_params
      params.require(:blog).permit(:title, :content)
    end
end
