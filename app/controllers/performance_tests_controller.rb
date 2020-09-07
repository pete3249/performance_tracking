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
    redirect_if_not_logged_in
    find_student
    params[:performance_test][:testing_date] = Date.strptime(params[:performance_test][:testing_date], "%m/%d/%Y")
    @performance_test = @student.performance_tests.build(params[:performance_test])
    @performance_test.user = current_user
    if @performance_test.save
      flash[:success] = "Test successfully stored"
      redirect "/performance_tests"
    else
      erb :"/performance_tests/new"
    end
  end

  get "/performance_tests/:id" do
    redirect_if_not_logged_in
    find_test
    erb :"/performance_tests/show"
  end

  get "/performance_tests/:id/edit" do
    find_test
    redirect_if_fail_to_authorize
    erb :"/performance_tests/edit"
  end

  patch "/performance_tests/:id" do
    find_test
    redirect_if_fail_to_authorize
    if @performance_test.update(params[:performance_test])
      flash[:success] = "Test successfully updated"
    else 
      redirect "/performance_tests/#{@performance_test.id}"
    end 
  end

  delete "/performance_tests/:id" do
    find_test
    redirect_if_fail_to_authorize
    @performance_test.destroy
    redirect "/performance_tests"
  end

  private

  def authorize(performance_test)
    current_user == performance_test.user
  end

  def redirect_if_fail_to_authorize
    if !authorize(@performance_test)
      flash[:error] = "You are not authorized to perform that action"
      redirect '/performance_tests' 
    end 
  end 

  def find_test
    @performance_test = PerformanceTest.find_by_id(params[:id])
    if @performance_test.nil?
      flash[:error] = "Couldn't find a test with id: #{params[:id]}"
      redirect "/performance_tests"
    end 
  end 

end
