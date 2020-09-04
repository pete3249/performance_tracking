class UsersController < ApplicationController

    #render form to create new user account
    get '/users/new' do
        erb :'/users/new'
    end

    #create new user
    post '/users' do
        
    end

end 