FactoryBot.define do
  factory :todo, class: 'TodoDomain::Models::Todo' do
    title { 'title' }
    body { 'body' }
  end
end
