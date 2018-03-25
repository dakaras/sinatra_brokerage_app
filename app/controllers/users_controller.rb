require 'rack-flash'
class UsersController < ApplicationController

  get '/signup' do
    if !session[:user_id]
      erb :'users/create_user'
    else
      redirect '/accounts'
    end
  end

  post '/signup' do
    user = User.create(params)
    if user.save
      session[:id] = user.id
      redirect '/accounts'
    else
      redirect '/signup'
    end
  end

  get '/login' do
    if logged_in?
      redirect '/accounts'
    else
      erb :'users/login'
    end
  end

  post '/login' do
    user = User.find_by(params[:username])
    if user && user.authenticate(params[:password])
      flash[:message] = "Welcome back, #{user.username}!"
      session[:id] = user.id
      redirect '/accounts'
    elsif user
      flash[:message] = "Incorrect password. Please try again."
      redirect to '/login'
    else
      flash[:message] = "Username not found. Please create user for accounts."
      redirect '/signup'
    end
  end

  get '/users/:id' do
    if !logged_in?
      redirect '/accounts'
    end

    @user = User.find_by(params[:id])
    if !@user.empty? && @user == current_user
      erb :'users/show'
    else
      redirect '/accounts'
    end
  end

end
