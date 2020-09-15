class UsersController < ApplicationController

    get '/users/new' do
        @user = User.new
        erb :'/users/new'
    end

    post '/users' do
        @user = User.new(params[:user])
        if @user.save
            session[:id] = @user.id
            redirect "/students"
        else
            @params = params[:user]
            erb :'/users/new'
        end 
    end

end 