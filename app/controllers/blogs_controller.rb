class BlogsController < ApplicationController


    before_action :set_blog, only: [:show, :edit, :update, :destroy]

    def index
      @blogs = blog.all
    end

    def show
    end


    def edit
      if @blog.user_id == current_user.id
      else
        redirect_to blogs_path
         flash[:again] = '権限がありません。'
      end
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
      if @blog.user_id == current_user.id
        @blog.destroy
        redirect_to blogs_path
      else
        redirect_to blogs_path
         flash[:again] = '権限がありません。'
      end
    end

    private
    def set_blog
      @blog = blog.find(params[:id])
    end

    def blog_params
      params.require(:blog).permit(:title, :content, :user_id)
    end
  end
