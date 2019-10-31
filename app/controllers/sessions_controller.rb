class SessionsController < ApplicationController

  skip_before_action :only_signed_in, only: [:new, :create]
  #before_action :only_signed_out,only: [:new, :create]
  def new

  end

  def create
    author_params = params.require(:author)
    @author = Author.where(username: author_params[:username]).or(Author.where(email: author_params[:email])).first
    if @author and @author.authenticate(author_params[:password])
      session[:auth] = @author.to_session
      redirect_to profil_path, success: 'connexion reussie'
    else
      redirect_to new_session_path, danger: 'identifiant incorrects'
    end
  end

  def destroy

  end
end
