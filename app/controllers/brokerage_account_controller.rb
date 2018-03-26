require 'rack-flash'
class AccountsController < ApplicationController

  get '/accounts' do
    if !logged_in
      redirect '/login'
    else
      @accounts = Account.all
      erb :'accounts/index'
    end
  end

  get '/accounts/new' do
    if !logged_in
      redirect '/login'
    else
      erb :'accounts/new'
    end
  end

  post '/accounts' do
    if !logged_in
      redirect '/login'
    else
      if params[:name] != "" && params[:category] != ""
        Account.create(params)
      else
        flash[:message] = "All fields are required to create account."
        erb :'accounts/new'
      end
    end

    get '/accounts/:id/edit' do
      if !logged_in
        redirect '/login'
      else
        @account = Account.find_by(params[:id])
        erb :'accounts/edit'
      end
    end

    get '/accounts/:id' do
      if !logged_in
        redirect '/login'
      else
        @account = Account.find_by(params[:id])
        erb :'accounts/show'
      end
    end

    patch '/accounts/:id' do
      @account = Account.find_by(params[:id])
      if !logged_in
        redirect '/login'
      else
        if params[:name] != "" && params[:category] != ""
          Account.create(params)
        else
          erb :'accounts/edit'
        end
      end
    end

  end
