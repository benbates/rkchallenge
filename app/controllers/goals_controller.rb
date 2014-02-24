class GoalsController < ApplicationController
  before_filter :signed_in_user
  # GET /goals
  # GET /goals.json
  def index
    @date = ""
    # @goals = Goal.order("created_at desc").all
    @goals = Goal.paginate(page: params[:page]).order("created_at DESC")


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @goals }
    end
  end

  def admin
    @date = ""
#    @goals = Goal.order("created_at desc").all
    @goals = Goal.paginate(page: params[:page]).order("created_at DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @goals }
    end
  end
  
  # GET /goals/1
  # GET /goals/1.json
  def show
    @goal = Goal.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @goal }
    end
  end

  # GET /goals/new
  # GET /goals/new.json
  def new
    @goal = Goal.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @goal }
    end
  end

  # GET /goals/1/edit
  def edit
    @goal = Goal.find(params[:id])
  end

  # POST /goals
  # POST /goals.json
  def create
    @et = params[:exercise_type]

    @goal = current_user.goals.create( :exercise_type_id => @et, :total => params[:goal][:total], :progress => 0 ) 

      respond_to do |format|
        if @goal.save 
          format.html { redirect_to "/users", notice: 'Goal successfully created.' }
          format.json { render json: @goal, status: :created, location: @goal }
        else
          format.html { render action: "new" }
          format.json { render json: @goal.errors, status: :unprocessable_entity }
        end
      end
    end
  

  # PUT /goals/1
  # PUT /goals/1.json
  def update
    @goal = Goal.find(params[:id])

    respond_to do |format|
      if @goal.update_attributes(params[:goal])
        format.html { redirect_to @goal, notice: 'Goal was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /goals/1
  # DELETE /goals/1.json
  def destroy
    @goal = Goal.find(params[:id])
    @goal.destroy

    respond_to do |format|
      format.html { redirect_to "/users", notice: 'Goal successfully deleted.' }
      format.json { head :no_content }
    end
  end
end