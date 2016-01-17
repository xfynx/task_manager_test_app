class AddAttachmentsToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :attachments, :json  # sqlite and mysql can't json
  end
end
