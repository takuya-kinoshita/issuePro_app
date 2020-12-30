class CommentsController < ApplicationController

  def show
  end

  def create
    #debugger
    @board = Board.find(params[:id])
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

  private

  def comment_params
    params.permit(:name, :content)
  end



end
