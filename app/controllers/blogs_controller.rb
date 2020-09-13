class BlogsController < ApplicationController
    def index
      @blogs = Blog.all
      @page_title = "All Blogs"
    end
  
    def new
      @blog = Blog.new
    end
  
    def create
      @blog = Blog.new(blog_params)
      if @blog.save
        redirect_to portfolios_path
      else
        render :new
      end
    end
  
    def edit
      @blog = Blog.friendly.find(params[:id])
    end
  
    def update
      @blog = Blog.friendly.find(params[:id])
  
      if @blog.update(blog_params)
        redirect_to portfolios_path
      else
        render :edit
      end
    end
    def show
      @blog = Blog.friendly.find(params[:id])
    end
    def destroy
      @blog = Blog.friendly.find(params[:id])
      if @blog.destroy
        redirect_to portfolios_path, notice: "Record was removed"
      end
    end
  
    private
  
    def blog_params
      params.require(:blog).permit(:title, :body)
    end
end
