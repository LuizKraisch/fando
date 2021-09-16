class AddUserReferenceToTasks < ActiveRecord::Migration[6.1]
  def change
    add_reference :tasks, :user, foreign_key: true, after: :finish_date
  end
end
