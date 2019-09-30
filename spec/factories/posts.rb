FactoryBot.define do
    
    factory :post do
        user_id { "1" }
        currency_pair { "USDJPY" }
        title { "ABC" }
        created_at {  Faker::Time.between(2.days.ago, Time.now, :all) }
    end
end