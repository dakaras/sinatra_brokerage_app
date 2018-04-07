require 'rack-flash'
class AccountsController < ApplicationController
  use Rack::Flash

  get '/accounts' do
    @accounts = current_user.accounts
    @stocks = Stock.all
    erb :'accounts/index'
  end

  get '/accounts/new' do
    erb :'accounts/new'
  end

  post '/accounts' do
    @account = Account.new(name: params[:name], category: params[:category], user_id: current_user.id)
    if @account.save
      flash[:message] = "You have created you're account!"
      binding.pry
      redirect "/accounts/#{@account.id}"
    else
      flash[:message] = "All fields are required to create account."
      erb :'accounts/new'
    end
  end

  get '/accounts/:id' do
    @account = Account.find_by(id: params[:id])
    erb :'accounts/show'
  end

  get '/accounts/:id/edit' do
    @account = Account.find(params[:id]) #.find doesn't need a keyword argument to search params hash
    if current_user.id == @account.user_id
      erb :'accounts/edit'
    else
      redirect '/accounts'
    end
  end

  patch '/accounts/:id' do
    @account = Account.find_by(id: params[:id])
    if params[:name] != " " && params[:category] != " " && current_user.id == @account.user_id
      @account.update(name: params[:name], category: params[:category], user_id: current_user.id)
      redirect "/accounts/#{@account.id}"
    else
      flash[:message] = "All fields required to edit account."
      redirect "/accounts/#{@account.id}"
    end
  end

  delete '/accounts/:id/delete' do
    @user = current_user
    @account = Account.find_by_id(params[:id])
    if @user && @account && @account.user_id == @user.id
      @account.delete
      flash[:message] = "Account has been deleted."
      redirect to '/accounts'
    else
      redirect to '/login'
    end
  end
end
