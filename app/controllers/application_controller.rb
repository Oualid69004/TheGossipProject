class ApplicationController < ActionController::Base


  before_action :only_signed_in
  add_flash_types :success, :danger
  helper_method :current_author, :author_signed_in?

  private

  def only_signed_in
    if !author_signed_in?
      redirect_to new_author_path, danger: "vous n'avez pas le droit d'acceder a cette page"
    end
  end

    def author_signed_in?
      !current_author.nil?
    end
  def only_signed_out
    redirect_to profil_path if author_signed_in?
  end


  def current_author
    return nil if !session[:auth] || !session[:auth]['id']
    return @_author if @_author
    @_author = Author.find_by_id(session[:auth]['id'])
  end


end
