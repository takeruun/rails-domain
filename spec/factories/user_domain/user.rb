FactoryBot.define do
  factory :user, class: 'UserDomain::Models::User' do
    email { 'test@example.com' }
    password { 'password' }
  end
end
