class BoardsController < ApplicationController
  def index
    @boards = Board.paginate(page: params[:page], per_page: 20)

  end

  def new
    @board = Board.new

  end

  def create

    @board = Board.create(board_params)
    if @board.save
    #debugger
       flash[:success] = "課題を作成しました"
       redirect_to @board
    else
       flash.now[:danger] = "保存に失敗しました"
       render 'new'
     end

  end

  def show
    @board = Board.find(params[:id])

  end

  def edit
    @board = Board.find(params[:id])
  end

  def update
    @board = Board.find(params[:id])
    @board.name = params[:name]
    @board.responsible = params[:responsible]
    @board.title = params[:title]
    @board.body = params[:body]
    @board.deadline = params[:deadline]


    if @board.update(board_params)
      flash[:success] = "編集しました"
      redirect_to board_path
    else
      render "edit"
    end

  end

  def destroy
    @board = Board.find(params[:id])
    if @board.destroy
      flash[:danger] = "削除しました"
      redirect_to boards_path
    end
  end


  private

  def board_params
    params.require(:board).permit(:name, :title, :body, :responsible, :deadline, :category_id, :picture, :progress)
  end


end
