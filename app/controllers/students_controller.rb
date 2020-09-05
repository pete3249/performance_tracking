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

  # GET: /students/5
  get "/students/:id" do
    erb :"/students/show"
  end

  # GET: /students/5/edit
  get "/students/:id/edit" do
    erb :"/students/edit"
  end

  # PATCH: /students/5
  patch "/students/:id" do
    redirect "/students/:id"
  end

  # DELETE: /students/5
  delete "/students/:id" do
    redirect "/students"
  end
end
