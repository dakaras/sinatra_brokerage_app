require 'rack-flash'
class StocksController < ApplicationController

  get '/stocks' do
    if !logged_in
      redirect '/login'
    else
      @stocks = Stock.all
      erb :'stocks/index'
    end
  end

  get '/stocks/new' do
    if !logged_in
      redirect '/login'
    else
      erb :'stocks/new'
    end
  end

  get '/stocks/:id' do
    if !logged_in
      redirect '/login'
    else
      @stock = Stock.find_by(params[:id])
      erb :'stocks.show'
    end
  end

  post '/stocks' do
    if !logged_in
      redirect '/login'
    else
      if params[:name] != "" && params[:ticker] != ""
        Stock.create(params)
        redirect '/stocks'
      else
        flash[:message] = "All fields are required to add stock to account."
        redirect '/stocks/new'
      end
    end
  end

  get '/stocks/:id/edit' do
    if !logged_in
      redirect '/login'
    else
      @stock = Stock.find_by(params[:id])
      erb :'stocks/edit'
    end
  end

  patch '/stocks/:id' do
    if !logged_in
      @stock = Stock.find_by(params[:id])
      if params[:name] != "" && params[:ticker] != ""
        Stock.update(params)
        redirect "/stocks/#{stock.id}"
      else
        flash[:message] = "All fields are required to add stock to account."
        redirect "/stocks/#{stock.id}"
      end
    end
  end

end
