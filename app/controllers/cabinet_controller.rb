class CabinetController < ApplicationController
  def index
    @users = User.with_role('user')
    @unassigned_tasks = Task.unassigned
  end

  def show
    @user = User.find_by(id: params[:id])
    render(file: "#{Rails.root}/public/404", layout: false, status: :not_found) unless @user.present?
  end
end
