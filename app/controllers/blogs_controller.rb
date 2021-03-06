class BlogsController < ApplicationController
  before_action :set_blog, only:[:show, :edit, :update, :destroy]

  def index
    @blogs = Blog.all.order(id: "desc")
  end

  def new
    if params[:back]
      @blog = Blog.new(blog_params)
    else
      @blog = Blog.new
    end
  end

  def create
    #以下2行を纏めた書き方@blog~
    #@blog = Blog.new(blog_params)
    #@blog.user_id = current_user.id
    @blog = current_user.blogs.build(blog_params)
    if @blog.save
      redirect_to blogs_path, notice: "投稿しました！"
    else
      render 'new'
    end
  end

  def show
  #  @blog = Blog.find(params[:id])
  end

  def edit
  #  @blog = Blog.find(params[:id])
  end

  def update
  #  @blog = Blog.find(params[:id])
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: "投稿を編集しました"
    else
      render 'edit'
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path, notice: "投稿を削除しました"
  end

  def confirm
    #以下2行を纏めた書き方@blog~
    #@blog = Blog.new(blog_params)
    #@blog.user_id = current_user.id
    @blog = current_user.blogs.build(blog_params)
    render :new if @blog.invalid?
  end

  private

  def blog_params
    params.require(:blog).permit(:content, :image, :image_cache)
  end

  def set_blog
    @blog = Blog.find(params[:id])
  end

end
