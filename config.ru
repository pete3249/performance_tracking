require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

# Tell Sinatra app to use these controllers to respond to requests
run ApplicationController
use StudentsController
use PerformanceTestsController
use UsersController
use SessionsController
