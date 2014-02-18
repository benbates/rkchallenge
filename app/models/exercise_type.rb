class ExerciseType < ActiveRecord::Base
  attr_accessible :name

  has_many :exercises
  has_many :goals
  has_many :users, through: :exercises
end
