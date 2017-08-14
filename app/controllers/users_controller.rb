class UsersController < ApplicationController
  def home
    render "home.html.erb"
  end

  def new
    render "new.html.erb"
  end


  def create
    users = User.new(
      email: params[:email],
      username: params[:username],
    )

    users.save
    redirect_to "/"
  end
end