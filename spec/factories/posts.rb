require 'faker'

FactoryBot.define do
    
    factory :post do
        user_id { "1" }
        currency_pair { "USDJPY" }
        title { "ABC" }
        created_at {  Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
        updated_at {  Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
    end
end