class BlogController < ApplicationController
    def index
        @blogs = Blog.all
    end

    def new
        @blog = Blog.new
    end

    def show
        @blog = Blog.find(params[:id])
    end

    def create
        @blog = Blog.create(blog_params)
        if @blog.title == ''
            redirect_to new_blog_path
        elsif @blog.content == ''
            redirect_to new_blog_path
        else
            redirect_to blogs_path 
        end
    end
    
    def destroy
        @blog = Blog.find(params[:id])
        if @blog.destroy
            redirect_to blogs_path  
        end
    end

private
    def blog_params
        params.require(:blog).permit(:title, :content)
    end
end
