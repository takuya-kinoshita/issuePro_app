class CommentsController < ApplicationController

  def show

  end

  def create
    #debugger
    @board = Board.find(params[:id])
    #debugger
    @comment = @board.comments.build(comment_params)
    if @comment.save
      flash[:success] = "コメントしました"
      redirect_to @board
    else
      flash.now[:danger] = "コメントに失敗しました"
      render @board
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
