class PerformanceTest < ActiveRecord::Base
    belongs_to :user
    belongs_to :student
    validates :name, presence: true
    validates :result, presence: true
    validates :testing_date, presence: true
end
