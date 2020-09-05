class Student < ActiveRecord::Base
    belongs_to :user
    has_many :performance_tests
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :grad_year, presence: true
end
