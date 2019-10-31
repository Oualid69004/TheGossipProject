class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @users = User.find(params[:id])
  end

  def edit
    @users = User.find(params[:id])
  end

  def update
    @users = User.find(params[:id])
    @users.update(users_params)
    redirect_to users_path
  end

  def new
    @users = User.new
  end
  def create
    user = User.create(users_params)
    redirect_to edit_user_path
  end
  def destroy
    @users = Gossip.find(params[:id])
    @users.destroy
    redirect_to users_path
  end

  private

  def users_params
    params.require(:user).permit(:prenom, :nom, :description, :email, :age)

  end
end
