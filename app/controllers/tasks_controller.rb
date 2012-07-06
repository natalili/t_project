class TasksController < ApplicationController

  # GET /tasks/1/edit
  def edit
    @task = Task.find(params[:id])

    respond_to do |format|
      format.html #edit.html.erb
      format.js {@task}
    end

  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(params[:task])
    respond_to do |format|
      if @task.save
        format.html { redirect_to root_path }
        format.js { @task }
      else
        format.html { redirect_to root_path }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
    @task = Task.find(params[:id])

    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to root_path }
        format.js {@task}
      else
        format.html { render action: "edit" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task = Task.find(params[:id])
    @task_id = params[:id]
    @task.destroy

    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { @task_id }
    end
  end
end
