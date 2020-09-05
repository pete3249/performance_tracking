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
    @student = Student.find_by_id(params[:id])
    erb :"/students/show"
  end

  get "/students/:id/edit" do
    @student = Student.find_by_id(params[:id])
    erb :"/students/edit"
  end

  patch "/students/:id" do
    @student = Student.find_by_id(params[:id])
    @student.update(params[:student])
    redirect "/students/#{@student.id}"
  end

  delete "/students/:id" do
    redirect "/students"
  end
end
