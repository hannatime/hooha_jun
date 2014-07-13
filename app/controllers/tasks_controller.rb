class TasksController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET /tasks
  # GET /tasks.json
  def index  
    @tasks = Task.accessible_by(current_ability).order(:task_due_date).page params[:page]
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    authorize! :show, @task
  end

  # GET /tasks/new
  def new
    @task = Task.new
    @tasks = [['Call', 'Call'], ['Meeting', 'Meeting'], ['Email', 'Email'] , ['Follow-Up', 'Follow-Up']]
  end

  # GET /tasks/1/edit
  def edit
    @task = Task.find(params[:id])
    authorize! :edit, @task
    @tasks = [['Call', 'Call'], ['Meeting', 'Meeting'], ['Email', 'Email'] , ['Follow-Up', 'Follow-Up'],['Closed', 'Closed']]
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)
    @task.user = current_user
    authorize! :create, @task
    
    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render action: 'show', status: :created, location: @task }
      else
        format.html { render action: 'new' }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task = Task.find(params[:id])
    authorize! :destroy, @task
    @task.destroy
    @tasks = Task.accessible_by(current_ability)
    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(
        :task_name, 
        :task_due_date, 
        :task_type, 
        :task_comments
        )
    end
end
