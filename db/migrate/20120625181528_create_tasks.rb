class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.integer :project_id
      t.boolean :is_done, :default => false
      t.datetime :time_end
      t.integer :prioritise

      t.timestamps
    end
  end
end
