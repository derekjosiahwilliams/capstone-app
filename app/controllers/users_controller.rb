class UsersController < ApplicationController
  def home
    render "home.html.erb"
  end

  def new
    @users = User.all
    render "new.html.erb"
  end


  def create
    users = User.new(
      username: params[:username],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if users.save
      session[:users_id] = users.id
      flash[:success] = 'Successfully created account!'
      redirect_to '/'
    else
      flash[:warning] = 'Invalid email or password!'
      redirect_to '/signup'
    end
  end
end