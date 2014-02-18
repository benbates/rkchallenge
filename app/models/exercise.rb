class Exercise < ActiveRecord::Base
  attr_accessible :date, :exercise_type_id, :reps, :exercise_date
    
	belongs_to :user
  belongs_to :exercise_type

end
