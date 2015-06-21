class CommentsController < ApplicationController
    before_action :authenticate_writter!, only:[ :create, :destroy]
  def create
    @comment = Comment.new( comment_params )
    @comment.save
    redirect_to post_path( @comment.post_id )
  end
  def destroy
    @comment = Comment.find( params[ :id ] )
    post = @comment.post
    @comment.destroy
    redirect_to customer_url( post )
  end

  def comment_params
    # params.rewuire(:key).permit(:filter)
    params.require( :comment ).permit(
      :body  ,
      :post_id,
      :writter_id,
      )
  end

end
