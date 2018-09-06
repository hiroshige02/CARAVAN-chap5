class BlogsController < ApplicationController
  def show
    @blog = Blog.find(params[:id])
  end

  def index
    @blogs = Blog.all
  end

  def new
  	@blog = Blog.new
  end

  def create
    # ストロングパラメーター使用
    blog = Blog.new(blog_params)
    # DBへ保存する
    blog.save
    # トップ画面へリダイレクト
    redirect_to blogs_path
  end

  def edit
  end

  private
    def blog_params
      params.require(:blog).permit(:title, :category, :body)
    end
end