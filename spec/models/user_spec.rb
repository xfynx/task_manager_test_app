require 'rails_helper'

RSpec.describe User, type: :model do
  it 'should be successfully created' do # проверим, что юзер успешно создаётся. Если не провалидируется мыло или пароль будет коротким, тест провалится
    user = create_and_get_user(email: 'example@example.com', password: '12345678', full_name: 'example_user')
    expect(user.full_name).to eq('example_user')
  end
end
