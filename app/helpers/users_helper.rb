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
    user.goals.where(exercise_type_id: exercise_type, completed_date: nil).first
  end

  def completed_goals(user)
    user.goals.where("completed_date IS NOT NULL")
  end

  def all_completed_goals
    Goal.where("completed_date IS NOT NULL").order("completed_date DESC")
  end
  
  def et_completed_goals(exercise_type)
    Goal.where( "completed_date IS NOT NULL" ).where(exercise_type_id: exercise_type).order("completed_date DESC")
  end
end
