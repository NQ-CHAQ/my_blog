class PostsController < ApplicationController
  def index
    @posts = Post.all

    @author = Author.find(1)
  end

  def show
  @post = Post.find( params[:id] )
  end

  def edit
  @post = Post.find( params[:id] )
  end

  def update
  #更新するデータオブジェクトを取得する
  @post = Post.find( params[:id] )

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
  @post = Post.find( params[:id] )
  @post.destroy
  redirect_to "/posts/"
  end


  private
  def post_params
    # params.rewuire(:key).permit(:filter)
    params.require(:post).permit(
      :title ,
      :body ,
      :category ,
      :image_url ,
      )
  end


end
