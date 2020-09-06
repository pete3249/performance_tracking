class PerformanceTestsController < ApplicationController

  get "/performance_tests" do
    @students = Student.all.sort
    erb :"/performance_tests/index"
  end

  get "/performance_tests/new" do
    redirect_if_not_logged_in
    find_student
    @performance_test = PerformanceTest.new
    erb :"/performance_tests/new"
  end

  post "/performance_tests" do
    find_student
    @performance_test = @student.performance_tests.build(params[:performance_test])
    @performance_test.user = current_user
    if @performance_test.save
      flash[:success] = "Test successfully stored"
      redirect "/performance_tests"
    else
      erb :"/performance_tests/new"
    end
  end

  # GET: /performance_tests/5
  get "/performance_tests/:id" do
    erb :"/performance_tests/show"
  end

  # GET: /performance_tests/5/edit
  get "/performance_tests/:id/edit" do
    erb :"/performance_tests/edit"
  end

  # PATCH: /performance_tests/5
  patch "/performance_tests/:id" do
    redirect "/performance_tests/:id"
  end

  # DELETE: /performance_tests/5
  delete "/performance_tests/:id" do
    redirect "/performance_tests"
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
