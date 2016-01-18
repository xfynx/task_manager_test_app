class Task < ActiveRecord::Base
  belongs_to :user
  mount_uploaders :attachments, AttachmentUploader

  validates :name, presence: true, length: {in: 5..255}
  validates :state, presence: true, inclusion: {in: %w(new started finished)}

  include AASM


  aasm column: 'state', no_direct_assignment: true do
    state :new, initial: true
    state :started
    state :finished

    event :run do
      transitions from: :new, to: :started
    end

    event :finish do
      transitions from: [:new, :started], to: :finished
    end
  end

end
