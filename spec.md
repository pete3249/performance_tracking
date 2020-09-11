# Specifications for the Sinatra Assessment

**Specs:**

[x] Use Sinatra to build the app
* Created simple, functioning web application in Ruby

[x] Use ActiveRecord for storing information in a database
* Persisted user, student, and performance test information to the database

[x] Include more than one model class (e.g. User, Post, Category)
* User, Student, and PerformanceTest classes

[x] Include at least one has_many relationship on your User model (e.g. User has_many Posts)
* A User has_many Students
* A Student has_many PerformanceTests

[x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
* A Student belongs_to a User
* A PerformanceTest belongs_to a Student

[x] Include user accounts with unique login attribute (username or email)
* User model validates that each email (used for login) is unique

[x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
* UsersController and PerformanceTestsController have 7 RESTful CRUD routes  

[x] Ensure that users can't modify content created by other users
* Methods in StudentsController authorize_user(student) and redirect_if_not_authorized 
* Both check to make sure the logged in User is the User that created the Student 

[x] Include user input validations
* User model validates presence of first name, last name, email, and password
* Student model validates presence of first name, last name, and graduation year
* PerformanceTest model validates presence of name, result, and testing date

[x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
* Added 'sinatra-flash' to the gemfile
* Then added it to configuration in ApplicationController with 'register Sinatra::Flash'
* User is shown "flash" one time messages

[x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code
* See README

Confirm
[x] You have a large number of small Git commits
[x] Your commit messages are meaningful
[x] You made the changes in a commit that relate to the commit message
[x] You don't include changes in a commit that aren't related to the commit message