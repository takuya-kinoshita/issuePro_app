class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)

  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params

  end



end
