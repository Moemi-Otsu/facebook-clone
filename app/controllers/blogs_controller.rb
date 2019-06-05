class BlogsController < ApplicationController

  def index
  end

  def new
    @blog = Blog.new
  end

  def create
    Blog.create(content: params[:blog][:content])
  end

end