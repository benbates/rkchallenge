module UsersHelper
  
  def goal_total(user, exercise_type)
    user.goals.where( exercise_type_id: exercise_type, completed_date: nil).first.total
  end

  def goal_remaining(user, exercise_type)
    user.goals.where( exercise_type_id: exercise_type, completed_date: nil).first.total - user.goals.where( exercise_type_id: exercise_type, completed_date: nil).first.progress
  end

  def goal_progress(user, exercise_type)
    user.goals.where( exercise_type_id: exercise_type, completed_date: nil).first.progress
  end

  def current_goal(user, exercise_type)
    user.goals.where( exercise_type_id: exercise_type, completed_date: nil).first
  end
  
end
