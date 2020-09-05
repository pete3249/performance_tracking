class SessionsController < ApplicationController

    # login to existing account
    get '/login' do
        erb :'sessions/login'
    end

    # read information from the form and determine if they can be logged on
    post '/login' do
        user = User.find_by_email(params[:email])
        if user && user.authenticate(params[:password])
            session[:id] = user.id
            redirect '/'
        else 
            @error = "Incorrect email or password, please try again"
            erb :'/sessions/login'
        end 
    end

    # clears the session, effectively logging out the user
    delete '/logout' do
        session.clear
        redirect '/'
    end

end 