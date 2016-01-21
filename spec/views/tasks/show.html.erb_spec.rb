require 'rails_helper'

RSpec.describe "tasks/show", type: :view do
  before(:each) do
    @task = assign(:task, Task.create!(
        name: "ExampleName",
        description: "MyText",
        user: User.last
    ))
  end

  login_admin
  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/ExampleName/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(I18n.t('activerecord.models.task.status.new'))
  end
end
