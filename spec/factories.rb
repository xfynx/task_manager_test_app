FactoryGirl.define do
  factory :user do
    full_name             'example'
    email                 'example@example.com'
    password              '12345678'
    roles                 { [ FactoryGirl.create(:role) ] }
  end

  factory :role do
    name       'admin'
  end
end