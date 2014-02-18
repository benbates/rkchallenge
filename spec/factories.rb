FactoryGirl.define do
  factory :user do
    name     "Ben Bates"
  end
  
  factory :exercise do
    exercise_type_id "1"
  end
  
  factory :result do
    content "Lorem ipsum"
    user
    
  end
end