require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :views, 'app/views'
    set :sessions, true
    set :session_secret, ENV["SESSION_SECRET"]
    set :method_override, true
    register Sinatra::Flash
  end

  get '/' do
    erb :welcome
  end

  private

  def current_user
      User.find_by_id(session[:id])
  end 

  def logged_in?
      !!current_user
  end

  def redirect_if_not_logged_in
    if !logged_in?
      flash[:error] = "You must be logged in to perform that action"
      redirect "/login"
    end 
  end

  def find_student
    @student = Student.find_by_id(params[:id])
    if @student.nil?
      flash[:error] = "Couldn't find a student with id: #{params[:id]}"
      redirect "/students"
    end 
  end 

end
