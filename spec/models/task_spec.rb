require 'rails_helper'

RSpec.describe Task, type: :model do
  it 'have name validation' do
    expect{Task.create!(name: nil, state: 'new')}.to raise_error(ActiveRecord::RecordInvalid)
  end
  it 'have state validation' do
    expect{Task.create!(name: 'example_name', state: 'PROCESSING')}.to raise_error(ActiveRecord::RecordInvalid)
  end
end
