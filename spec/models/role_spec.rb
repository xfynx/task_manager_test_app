require 'rails_helper'

RSpec.describe Role, type: :model do
  it 'admin should can manage all' do
    user = create_and_get_user(email: 'example@example.com', password: '12345678', full_name: 'example_user')
    user.add_role('admin')
    expect(Ability.new(user).can?(:manage, :all)).to eq(true)
  end
end
