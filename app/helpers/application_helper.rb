module ApplicationHelper
  MAIN_TITLE = 'Task Manager Test App (TMTA)'
  def get_title(title)
    title.present? ? "#{MAIN_TITLE} | #{title}" : MAIN_TITLE
  end
end
