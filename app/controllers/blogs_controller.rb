class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  def index
    @blogs = Blog.all
    # binding.pry 一応消しといた。
    # raise
  end

  def new
    @blog = Blog.new
  end

  def create
    # Blog.create(title: params[:blog][:title], content: params[:blog][:content])
    # paramsはターミナルのparameterの内容
    # Parameters: {"utf8"=>"✓", "authenticity_token"=>"pjm3hUIIYcYC4DZg6GseBXMfyywD3+WiKCODKoD3Hm8G9C3P69Lcv9ikUeoBHDT0AptywoAo+aG4Chh3ARtC0w==",
    # "blog"=>{"title"=>"hoge", "content"=>"huga"}, "commit"=>"Create Blog"}
    # ここのアクション内容は中身を取り出す為に行うコード
     @Blog = Blog.new(blog_params)
      # 一番上の記述を上記に変えた（簡潔にした）
      if @Blog.save
    # 一覧画面へ遷移して"ブログを作成しました！"とメッセージを表示します。
    redirect_to new_blog_path,notice:"ブログを作成しました！"
      else
    # 入力フォームを再描画します。
    render 'new'
      end
  end

  def show
    # 追記する
    # @blog = Blog.find(params[:id])
    # なんでここは[]のかっこなんだろ？
  end

  def edit
    # @blog = Blog.find(params[:id])
  end

  def update
    # @blog = Blog.find(params[:id])
    if @blog.update(blog_params) #blog_paramsはストロングパラメータ
      redirect_to blogs_path, notice: "ブログを編集しました！"
    else
      render 'edit'
    end
  end

  def destroy

  end


  private

 def blog_params
   params.require(:blog).permit(:title, :content)
 end

 def set_blog
     @blog = Blog.find(params[:id])
   end
end
