FactoryBot.define do
  factory :article do
    id { SecureRandom.random_number }
    title { Faker::Lorem.sentence }
    body { Faker::Lorem.paragraph }
  end
end
