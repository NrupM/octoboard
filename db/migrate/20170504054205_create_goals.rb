class CreateGoals < ActiveRecord::Migration[5.1]
  def change
    create_table :goals do |t|
      t.string :daily_goal
      t.string :longterm_goal
      t.string :weekly_goal
      t.date :longterm_goal_date
      t.integer :applications_per_day
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
