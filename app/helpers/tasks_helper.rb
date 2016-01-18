module TasksHelper
  def download_file_link(task_id, filename)
    link_to filename, "/tasks/#{task_id}/download_file/#{filename}"
  end

  def state_select_values
    [
      [t('activerecord.models.task.status.new'), 'new'],
      [t('activerecord.models.task.status.started'), 'started'],
      [t('activerecord.models.task.status.finished'), 'finished']
    ]
  end
end
