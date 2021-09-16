class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.datetime :start_date
      t.datetime :finish_date
      t.boolean :is_important
      t.string :icon

      t.timestamps
    end
  end
end
