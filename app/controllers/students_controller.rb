class StudentsController < ApplicationController

  get "/students" do
    @students = Student.all
    erb :"/students/index"
  end

  get "/students/new" do
    erb :"/students/new"
  end

  post "/students" do
    @student = current_user.students.build(params[:student])
    if @student.save
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
    erb :"/students/edit"
  end

  patch "/students/:id" do
    find_student
    @student.update(params[:student])
    redirect "/students/#{@student.id}"
  end

  delete "/students/:id" do
    find_student
    @student.destroy
    redirect "/students"
  end

  private

  def find_student
    @student = Student.find_by_id(params[:id])
    if @student.nil?
      flash[:error] = "Couldn't find a student with id: #{params[:id]}"
      redirect "/students"
    end 
  end 

end
