class MyValidator < ActiveModel::Validator
  def validate(record)
    if Goal.exists?(:exercise_type_id => record.exercise_type_id, :completed_date => nil, :user_id => record.user_id)
      record.errors.add :base, "You already have a current goal for #{ExerciseType.find(record.exercise_type_id).name}"
    end
  end

end

class Goal < ActiveRecord::Base
  include ActiveModel::Validations
  attr_accessible :total, :progress, :completed_date, :exercise_type_id

  validates_with MyValidator, :on => :create

  belongs_to :user
  belongs_to :exercise_type

end