class User < ActiveRecord::Base
  attr_accessible :name
  
  validates :name, presence: true 
  
	has_many :goals
  has_many :exercises 
  has_many :exercise_types, through: :exercises
end
