class PerformanceTestsController < ApplicationController

  # GET: /performance_tests
  get "/performance_tests" do
    erb :"/performance_tests/index.html"
  end

  # GET: /performance_tests/new
  get "/performance_tests/new" do
    erb :"/performance_tests/new.html"
  end

  # POST: /performance_tests
  post "/performance_tests" do
    redirect "/performance_tests"
  end

  # GET: /performance_tests/5
  get "/performance_tests/:id" do
    erb :"/performance_tests/show.html"
  end

  # GET: /performance_tests/5/edit
  get "/performance_tests/:id/edit" do
    erb :"/performance_tests/edit.html"
  end

  # PATCH: /performance_tests/5
  patch "/performance_tests/:id" do
    redirect "/performance_tests/:id"
  end

  # DELETE: /performance_tests/5
  delete "/performance_tests/:id" do
    redirect "/performance_tests"
  end
end
