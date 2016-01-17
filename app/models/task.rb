class Task < ActiveRecord::Base
  belongs_to :user
  mount_uploaders :attachments, AttachmentUploader
end
