require 'rack-flash'
class UsersController < ApplicationController
  use Rack::Flash

  get '/signup' do
    if !session[:user_id]
      @user = current_user
      erb :'users/create_user'
    else
      redirect '/accounts'
    end
  end

  post '/signup' do
    @user = User.new(username: params[:username], password: params[:password], email: params[:email])
    if @user.save
      @user = User.create(username: params[:username], password: params[:password], email: params[:email])
      session[:id] = @user.id
      erb :'accounts/new'
    elsif User.all.detect{|username| params[:username]== username}
      flash[:message] = "That username is taken. Please try a different one."
      binding.pry
      redirect '/login'
    else
      flash[:message] = "All fields must be filled to create a new user. Please try again."
      binding.pry
      redirect '/signup'
    end
  end

  get '/login' do
    if !session[:user_id]
      erb :'users/login'
    else
      redirect '/accounts'
    end
  end

  post '/login' do
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      flash[:message] = "Welcome back, #{user.username}!"
      session[:id] = user.id
      redirect to '/accounts'
    elsif user
      flash[:message] = "Incorrect password. Please try again."
      redirect to '/login'
    else
      flash[:message] = "Username not found. Please create user to setup accounts."
      redirect '/signup'
    end
  end

  get '/logout' do
    session.clear
    redirect '/login'
  end

  get '/users/:id' do
    @user = User.find_by(params[:id])
    if !@user.empty? && @user == current_user
      erb :'users/show'
    else
      redirect '/accounts'
    end
  end

end
