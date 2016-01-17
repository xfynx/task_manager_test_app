require 'rails_helper'

RSpec.describe User, type: :model do
  it 'should be successfully created' do # проверим, что юзер успешно создаётся. Если не провалидируется мыло или пароль будет коротким, тест провалится
    user = create_and_get_user(email: 'example@example.com', password: '12345678', full_name: 'example_user')
    expect(user.full_name).to eq('example_user')
  end

  it 'should can manage all' do
    user = create_and_get_user(email: 'example@example.com', password: '12345678', full_name: 'example_user')
    user.add_role('admin')  # тест провалится, если роль будет не админ
    expect(Ability.new(user).can?(:manage, :all)).to eq(true)
  end

  private
  def create_and_get_user(option)
    User.create(option)
    User.find_by(email: option[:email]) if option[:email].present?
  end
end
