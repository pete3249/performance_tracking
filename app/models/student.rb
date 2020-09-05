class Student < ActiveRecord::Base
    belongs_to :user
    has_many :performance_tests
end
