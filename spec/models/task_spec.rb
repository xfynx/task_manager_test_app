require 'rails_helper'

RSpec.describe Task, type: :model do
  it 'have name validation' do
    expect { Task.create!(name: nil) }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'have state validation' do
    expect { Task.create!(name: 'example_name', state: 'PROCESSING') }.to raise_error # AASM have self exceptions that throws before RecordInvalid so catching it with common
  end

  it 'state started from "new"' do
    expect { Task.create!(name: 'Example', state: 'finished') }.to raise_error
  end

  it 'have correct state changing' do
    task1 = Task.create(name: 'Task1')
    task2 = Task.create(name: 'Task2')
    expect(task1.state).to eq('new')
    task1.run
    expect(task1.state).to eq('started')
    expect { task1.state = 'new' }.to raise_error
    task1.finish
    task2.finish
    expect(task1.state).to eq('finished')
    expect(task2.state).to eq('finished')
  end

  it 'have scopes' do
    expect(Task.unassigned.size).to be >=  1
    expect(Task.finished.size).to be >=  1
    expect(Task.in_work.size).to be >=  1
  end
end
