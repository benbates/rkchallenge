class ExercisesController < ApplicationController
  before_filter :signed_in_user

  # GET /exercises
  # GET /exercises.json
  def index
    @date = ""
    # @exercises = Exercise.order("created_at desc").all
    @exercises = Exercise.paginate(page: params[:page]).order("created_at DESC")


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @exercises }
    end
  end

  def admin
    @date = ""
#    @exercises = Exercise.order("created_at desc").all
    @exercises = Exercise.paginate(page: params[:page]).order("created_at DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @exercises }
    end
  end
  
  # GET /exercises/1
  # GET /exercises/1.json
  def show
    @exercise = Exercise.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @exercise }
    end
  end

  # GET /exercises/new
  # GET /exercises/new.json
  def new
    @exercise = Exercise.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @exercise }
    end
  end

  # GET /exercises/1/edit
  def edit
    @exercise = Exercise.find(params[:id])
  end

  # POST /exercises
  # POST /exercises.json
  def create

    @et = params[:exercise_type]

    @date = Date.strptime(params[:results][:exercise_date], "%m/%d/%Y")
    @exercise = current_user.exercises.create( :exercise_type_id => @et, :reps => params[:results][:reps], :exercise_date => @date ) 
    if current_user.goals.exists?(:exercise_type_id => @et, :completed_date => nil)
      @goal = current_user.goals.where(:exercise_type_id => @et, :completed_date => nil).first
      @goal.progress += params[:results][:reps].to_i
      if @goal.progress >= @goal.total
        @goal.completed_date = Date.today
        @goal.progress = @goal.total
      end
      @goal.save
    end

      respond_to do |format|
        if @exercise.save 
          format.html { redirect_to "/users", notice: 'Exercise successfully created.' }
          format.json { render json: @exercise, status: :created, location: @exercise }
        else
          format.html { render action: "new" }
          format.json { render json: @exercise.errors, status: :unprocessable_entity }
        end
      end
    end
  

  # PUT /exercises/1
  # PUT /exercises/1.json
  def update
    @exercise = Exercise.find(params[:id])

    respond_to do |format|
      if @exercise.update_attributes(params[:exercise])
        format.html { redirect_to @exercise, notice: 'Exercise was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @exercise.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exercises/1
  # DELETE /exercises/1.json
  def destroy
    @exercise = Exercise.find(params[:id])
    @exercise.destroy

    respond_to do |format|
      format.html { redirect_to "/users", notice: 'Exercise successfully deleted.' }
      format.json { head :no_content }
    end
  end
end
