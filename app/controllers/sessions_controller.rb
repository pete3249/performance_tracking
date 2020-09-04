class SessionsController < ApplicationController

    # login to existing account
    get '/login' do
        erb :'sessions/login'
    end

    # read information from the form and determine if they can be logged on
    post '/login' do
        
    end

end 