class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    render :text => "In create" and return
    
  end
  
end
