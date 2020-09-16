FactoryBot.define do
  factory :menu do
    title { Faker:: Lorem.word }
    author { Faker::Number.number(digits: 10)}
  end
end