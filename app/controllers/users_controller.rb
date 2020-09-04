class UsersController < ApplicationController

    #render form to create new user account
    get '/users/new' do
        erb :'/users/new'
    end

    #create new user
    post '/users' do
        user = User.new(params[:user])
        if user.save
            session[:id] = user.id
            redirect '/'
        else
            redirect '/users/new'
        end 
    end

end 