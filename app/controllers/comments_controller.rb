class CommentsController < ApplicationController

  def create
    @dessert = Dessert.find(params[:dessert_id])
    @comment = @dessert.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save!
      redirect_to dessert_path(@dessert)
    end
  end

  def destroy
    @dessert = Dessert.find(params[:dessert_id])
    @comment = Comment.find(params[:id])

    if current_user.admin?
      @comment.destroy
      redirect_to dessert_path(@dessert)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
