module ApplicationHelper
  MAIN_TITLE = 'Task Manager Test App (TMTA)'
  def get_title(title)
    title.present? ? "#{MAIN_TITLE} | #{title}" : MAIN_TITLE
  end

  def state_sort_order_link
    tasks_path(state: params[:state] == 'asc' ? 'desc' : 'asc')
  end
end
