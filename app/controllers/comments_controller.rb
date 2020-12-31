class CommentsController < ApplicationController

  def show

  end

  def create

    @board = Board.find(params[:id])
    @comment = @board.comments.build(comment_params)
    if @comment.save
      flash[:success] = "コメントしました"
      redirect_to @board
    else
      flash[:danger] = "コメントに失敗しました"
      redirect_to @board
    end
  end

  def edit
  end

  def destroy
      comment = Comment.find(params[:id])
      comment.delete
      flash[:success] = "コメントを削除しました"
      redirect_to comment.board
  end

  private

  def comment_params
    params.permit(:name, :content)
  end



end
