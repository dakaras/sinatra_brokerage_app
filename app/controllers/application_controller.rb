require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "buythedip"
  end

  get '/' do
    erb :index
  end

  # before do
  #   pass if ["login", "signup", nil].include? request.path_info.split('/')[1]
  #   if !logged_in?
  #     redirect '/'
  #   end
  # end

  helpers do
    # def redirect_if_not_logged_in
    #   if !logged_in?
    #     redirect "/login"
    #   end
    # end

    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end
  end

end
