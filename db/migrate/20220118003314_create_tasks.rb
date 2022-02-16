class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|

      t.string :title
      t.references :user, foreign_key: :true
      t.integer :is_done, default: 0
      t.date :limit_day
      t.time :limit_time

      t.timestamps
    end
  end
end
