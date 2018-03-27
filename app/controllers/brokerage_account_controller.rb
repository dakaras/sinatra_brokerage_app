require 'rack-flash'
class AccountsController < ApplicationController
  use Rack::Flash

  get '/accounts' do
    redirect_if_not_logged_in
    @accounts = current_user.accounts
    erb :'accounts/index'
  end

  get '/accounts/new' do
      erb :'accounts/new'
  end

  post '/accounts' do
      if params[:name] != "" && params[:category] != ""
        Account.create(params[:account])
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
      if params[:name] != "" && params[:category] != ""
        @account.update
        redirect "/accounts/#{@account.id}"
      else
        flash[:message] = "All fields required to edit account."
        redirect "/accounts/#{@account.id}"
      end
  end

end
