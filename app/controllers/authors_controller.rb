class AuthorsController < ApplicationController

  skip_before_action :only_signed_in, only: [:new, :create, :confirm]
  #before_action :only_signed_out,only: [:new, :create, :confirm]


  def new
    @author = Author.new
  end

  def create
     author_params = params.require(:author).permit(:username, :email, :password, :password_confirmation)
     @author = Author.new(author_params)
     if @author.valid?
        @author.save
        redirect_to new_author_path, success:'votre compte a bien ete cree'
       render 'new'
     else
       render 'new'
    end
  end

  def confirm
    @author =Author.find(params[:id])
    if @author.confirmation_token == params[:token]
       @author.update_attributes(confimed: true, confirmation_token: nil)
       @user.save(validate: false)
       session[:auth]=@author.to_session
       redirect_to profil_path, success: 'votre compte a bien ete confirme'
    else
      redirect_to new_author_path, danger: 'Ce token ne semble pas valide1'
    end
  end
  def edit
    @author = current_author

  end
  def update

  end
end
