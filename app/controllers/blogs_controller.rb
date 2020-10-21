class BlogsController < ApplicationController
  before_action :blog_find, only: [:show, :edit, :update, :destroy]
  layout "blog"
  access all: [], user: {except: [:show, :index, :destroy, :new, :create, :update, :edit]}, site_admin: :all
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
    end
  
    def update
  
      if @blog.update(blog_params)
        redirect_to portfolios_path
      else
        render :edit
      end
    end
    def show
    end
    def destroy
      if @blog.destroy
        redirect_to portfolios_path, notice: "Record was removed"
      end
    end
  
    private
  
    def blog_params
      params.require(:blog).permit(:title, :body)
    end

    def blog_find
      @blog = Blog.friendly.find(params[:id])

    end
end
