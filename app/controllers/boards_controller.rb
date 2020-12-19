class BoardsController < ApplicationController
  def index
    @boards = Board.paginate(page: params[:page], per_page: 5)

  end

  def new
    @board = Board.new

  end

  def create
    #binding.pry
    @board = Board.create(board_params)
    @board.save
    #binding.pry
    redirect_to "/boards"
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
      flash[:notice] = "success editing"
      redirect_to boards_path
    else
      render "edit"
    end

  end

  def destroy
    @board = Board.find(params[:id])
    if @board.destroy
      flash[:notice] = "contents deleted"
      redirect_to boards_path
    end
  end


  private

  def board_params
    params.require(:board).permit(:name, :title, :body, :responsible, :deadline, :category_id)
  end


end
