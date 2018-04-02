require 'rack-flash'
class StocksController < ApplicationController
  use Rack::Flash

  get '/stocks' do
    @account = Account.find_by(id: params[:id]) #.find_by requires keyword argument symbols to search params
    @stocks = Stock.all
    erb :'stocks/index'
  end

  get '/stocks/new' do
    @user = current_user
    erb :'stocks/new'
  end

  post '/stocks' do #add logic to associate stock with account, push stock to @account.stocks
    @account = Account.find(params[:account_id])
    if params[:name] != "" && params[:ticker] != ""
      @stock = Stock.create(name: params[:name], ticker: params[:ticker], shares: params[:shares])
      @stock.accounts << @account
      flash[:message] = "Stock has been added to Account."
      redirect '/accounts'
    else
      flash[:message] = "All fields are required to add stock to account."
      redirect '/stocks/new'
    end
  end


  get '/stocks/:id/edit' do
    @stock = Stock.find_by(id: params[:id])
    erb :'stocks/edit'
  end

  patch '/stocks/:id' do
    @stock = Stock.find_by(id: params[:id])
    if params[:name] != "" && params[:ticker] != ""
      Stock.update(params)
      redirect "/stocks/#{stock.id}"
    else
      flash[:message] = "All fields are required to add stock to account."
      redirect "/stocks/#{stock.id}"
    end
  end

  get '/stocks/:id' do
    @stock = Stock.find_by(id: params[:id])
    @accounts = @stock.accounts
    erb :'stocks/show'
  end

  delete '/stocks/:id/delete' do
    @user = current_user
    @stock = Stock.find_by_id(params[:id]) #don't need keyword argument, only searches for an id
    if @user && @stock  #if stock is located and current_user is logged in, then stock will be sold.
      @stock.delete
      flash[:message] = "Your stock postion has been closed out."
      redirect to '/accounts'
    else
      redirect to '/login'
    end
  end
end
