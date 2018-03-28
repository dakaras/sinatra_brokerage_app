require 'rack-flash'
class AccountsController < ApplicationController
  use Rack::Flash

  get '/accounts' do
    @accounts = current_user.accounts
    erb :'accounts/index'
  end

  get '/accounts/new' do
    erb :'accounts/new'
  end

  post '/accounts' do
    if params[:name] != "" && params[:category] != ""
      Account.create(name: params[:name], category: params[:category])
        redirect 'stocks/new'
    else
      flash[:message] = "All fields are required to create account."
      erb :'accounts/new'
    end
  end

  get '/accounts/:id' do
    @account = Account.find_by(params[:id])
    erb :'accounts/show'
  end

  get '/accounts/:id/edit' do
    @account = Account.find_by(params[:id])
    erb :'accounts/edit'
  end

  patch '/accounts/:id' do
    @account = Account.find_by(params[:id])
    if params[:name] != "" && params[:category] != "" && current_user.id == @account.user_id
      @account.update(name: params[:name], category: params[:category])
      redirect "/accounts/#{@account.id}"
    else
      flash[:message] = "All fields required to edit account."
      redirect "/accounts/#{@account.id}"
    end
  end

end
