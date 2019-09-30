FactoryBot.define do
    
    factory :post do
        user_id { "1" }
        currency_pair { "USDJPY" }
        title { "ABC" }
    end
end