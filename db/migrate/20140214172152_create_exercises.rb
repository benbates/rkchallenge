class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercise_types do |t|
      t.string :name
      t.timestamps
    end
 
    create_table :users do |t|
      t.string :name
      t.timestamps
    end
 
    create_table :exercises do |t|
      t.belongs_to :user
      t.belongs_to :exercise_type
      t.date :exercise_date
      t.integer :reps      
      t.timestamps
    end

    create_table :goals do |t|
      t.belongs_to :user
      t.belongs_to :exercise_type
      t.date :completed_date
      t.integer :total
      t.integer :progress
      t.timestamps
    end

  end
end
