require 'rails_helper'

RSpec.describe "tasks/index", type: :view do
  before(:each) do
    assign(:tasks, [
        Task.create!(
            name: "ExampleName",
            description: "MyText",
            user: User.first
        ),
        Task.create!(
            name: "ExampleName",
            description: "MyText",
            user: User.first
        )
    ])
  end

  login_admin
  it "renders a list of tasks" do
    render
    assert_select "tr>td>a", text: /#\d{1,10} ExampleName/, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: I18n.t('activerecord.models.task.status.new'), count: 2
  end
end
