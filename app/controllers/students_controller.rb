class StudentsController < ApplicationController

  get "/students" do
    @students = Student.all.sort_by {|student| student.last_name}
    erb :"/students/index"
  end

  get "/students/new" do
    redirect_if_not_logged_in
    @student = Student.new
    erb :"/students/new"
  end

  post "/students" do
    redirect_if_not_logged_in
    @student = current_user.students.build(params[:student])
    if @student.save
      flash[:success] = "Student successfully created"
      redirect "/students"
    else
      erb :'/students/new'
    end 
  end

  get "/students/:id" do
    find_student
    erb :"/students/show"
  end

  get "/students/:id/edit" do
    find_student
    redirect_if_not_authorized
    erb :"/students/edit"
  end

  patch "/students/:id" do
    find_student
    redirect_if_not_authorized
    if @student.update(params[:student])
      flash[:success] = "Student successfully updated"
      redirect "/students/#{@student.id}"
    else
      redirect "/students/#{@student.id}/edit"
    end 
  end

  delete "/students/:id" do
    find_student
    redirect_if_not_authorized
    @student.destroy
    redirect "/students"
  end

  private

  def authorize_user(student)
    current_user == student.user
  end

  def redirect_if_not_authorized
    if !authorize_user(@student)
      flash[:error] = "You are not authorized to perform that action"
      redirect '/students' 
    end 
  end 

end
