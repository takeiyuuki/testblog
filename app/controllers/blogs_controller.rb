class BlogsController < ApplicationController
  def index
  end

  def new
    @blog = Blog.new
  end

  def create
    Blog.create(title: params[:blog][:title], content: params[:blog][:content])
    # paramsはターミナルのparameterの内容
    # Parameters: {"utf8"=>"✓", "authenticity_token"=>"pjm3hUIIYcYC4DZg6GseBXMfyywD3+WiKCODKoD3Hm8G9C3P69Lcv9ikUeoBHDT0AptywoAo+aG4Chh3ARtC0w==",
    # "blog"=>{"title"=>"hoge", "content"=>"huga"}, "commit"=>"Create Blog"}
    # ここのアクション内容は中身を取り出す為に行うコード
  end
end
