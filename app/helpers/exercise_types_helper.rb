module ExerciseTypesHelper

  def all_exercise_types
    @all_exercise_types = ['All']
    ExerciseType.all.each do |gt|
      @all_exercise_types.push gt.name
    end
    @all_exercise_types
  end
end
