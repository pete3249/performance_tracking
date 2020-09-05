class CreatePerformanceTests < ActiveRecord::Migration
  def change
    create_table :performance_tests do |t|
      t.string :name
      t.string :result
      t.date :testing_date
      t.integer :student_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
