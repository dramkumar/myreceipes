class PagesController < ApplicationController
  
  def home
      redirect_to receipes_path if logged_in?
  end
  
end