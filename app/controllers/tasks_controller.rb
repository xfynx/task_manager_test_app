class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :find_task, only: [:pick_up, :start_task, :finish_task]

  def index
    state_order = params[:state] if params[:state].present?
    @tasks = if state_order.present?
               Task.all.order(state: state_order) if state_order=='desc' || state_order=='asc'
             else
               Task.all
             end
  end

  def show
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    @task = Task.new(task_params)
    @task.user = current_user if @task.user.nil? && !current_user.can?(:manage, :all)
    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: I18n.t('controllers.task.created') }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: I18n.t('controllers.task.updated') }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: I18n.t('controllers.task.destroyed') }
      format.json { head :no_content }
    end
  end

  def download_file
    send_file("#{Rails.root}/public/uploads/task/attachments/#{params[:id]}/#{params[:filename]}.#{params[:format]}")
  end

  def pick_up
    unless current_user.can?(:manage, :all) || @task.nil?
      @task.update_attribute(:user, current_user)
      @notice = I18n.t('controllers.task.picked_up', email: current_user.email)
    end
    @task.present? ? redirect_to(@task, notice: @notice) : redirect_to(tasks_path)
  end

  def start_task
    if !current_user.can?(:manage, :all) && @task.present? && @task.user == current_user
      @task.run && @task.save!
      @notice = I18n.t('controllers.task.started')
    end
    @task.present? ? redirect_to(@task, notice: @notice) : redirect_to(tasks_path)
  end

  def finish_task
    if @task.present? && (current_user.can?(:manage, :all) || @task.user == current_user)
      @task.finish && @task.save!
      @notice = I18n.t('controllers.task.finished')
    end
    @task.present? ? redirect_to(@task, notice: @notice) : redirect_to(tasks_path)
  end

  private
  def find_task
    @task, @notice = Task.find_by(id: params[:id]), ''
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :description, :state, :user_id, [attachments: []])
  end
end
