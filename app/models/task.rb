class Task < ActiveRecord::Base
  belongs_to :user
  mount_uploaders :attachments, AttachmentUploader

  validates :name, presence: true, length: {in: 5..255}
  validates :state, inclusion: {in: %w(new started finished)}
end
