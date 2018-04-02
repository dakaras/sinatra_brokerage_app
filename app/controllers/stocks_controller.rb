require 'rack-flash'
class StocksController < ApplicationController
  use Rack::Flash

  get '/stocks' do
    @account = Account.find_by(id: params[:id])
    @stocks = Stock.all
    erb :'stocks/index'
  end

  get '/stocks/new' do
    @user = current_user
    erb :'stocks/new'
  end

  post '/stocks' do #add logic to associate stock with account, push stock to @account.stocks
    @account = Account.find_by(id: params[:id]) #.find_by requires keyword argument symbols to search params
    if params[:name] != "" && params[:ticker] != ""
      @stock = Stock.create(name: params[:name], ticker: params[:ticker])
      binding.pry
      @stock.accounts << @account
      binding.pry
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
    erb :'stocks/show'
  end

  delete '/stocks/:id/delete' do
    @user = current_user
    @stock = Stock.find_by_id(params[:id])
    if @user && @stock
      @stock.delete
      flash[:message] = "Account has been deleted."
      redirect to '/accounts'
    else
      redirect to '/login'
    end
  end
end
