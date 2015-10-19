class CommentsController < ApplicationController

  def index

  end

  def create

    @comment = current_item.comments.build(comment_params)
    if @comment.save
      flash[:success] = 'Comment created!'
      redirect_to current_item
    else
      render '/'
    end
  end

  def destroy
  end

  private

  def current_item
    @current_item = Item.find_by(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:comment_text)
  end

end
