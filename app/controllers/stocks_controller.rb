require 'rack-flash'
class StocksController < ApplicationController
  use Rack::Flash

  get '/stocks' do
    @stocks = Stock.all
    erb :'stocks/index'
  end

  get '/stocks/new' do
    erb :'stocks/new'
  end

  post '/stocks' do
    if params[:name] != "" && params[:ticker] != ""
      Stock.create(name: params[:name], ticker: params[:ticker])
      redirect '/accounts'
    else
      flash[:message] = "All fields are required to add stock to account."
      redirect '/stocks/new'
    end
  end

  get '/stocks/:id/edit' do
    @stock = Stock.find_by(params[:id])
    erb :'stocks/edit'
  end

  patch '/stocks/:id' do
    @stock = Stock.find_by(params[:id])
    if params[:name] != "" && params[:ticker] != ""
      Stock.update(params)
      redirect "/stocks/#{stock.id}"
    else
      flash[:message] = "All fields are required to add stock to account."
      redirect "/stocks/#{stock.id}"
    end
  end

  get '/stocks/:id' do
    @stock = Stock.find_by(params[:id])
    erb :'stocks/show'
  end
end
