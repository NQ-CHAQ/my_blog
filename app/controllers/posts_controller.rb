class PostsController < ApplicationController
  before_action :set_post, only:[:show, :edit, :update, :destroy]
  before_action :authenticate_writter!
  def index
    #@posts = Post.all
    #@posts = Post.page( params[:page] )

    #modelで定義した最新記事５件のみ表示用インスタンス
    @new_posts = Post.find_newest_article()
    @author = Author.find(1)
  end

  def show
    @comment = Comment.new
  end

  def edit
  end

  def update
  #取得したパラメーターで上書きして保存
  @post.update_attributes( post_params )

   #show.html.erbへ飛ばす
   redirect_to "/posts/#{@post.id}"
  end

  def new
    @post = Post.new
  end

 def create
    # formからデータを受け取る
    @post = Post.new( post_params )
    # これを保存する
    @post.save
    # show.html.erbへ飛ばす
    redirect_to "/posts/#{@post.id}"
  end

  def destroy
  @post.destroy
  redirect_to "/posts/"
  end

  private
  def post_params
    # params.rewuire(:key).permit(:filter)
    params.require(:post).permit(
      :title ,
      :body  ,
      :category_id,
      )
  end

  def set_post
    @post = Post.find( params[:id] )
  end



end
