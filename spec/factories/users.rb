FactoryBot.define do
    
    factory :user do
        nickname { "test" }
        email { "kkk@gmail.com" }
        password { "0000000" }
        password_confirmation { "0000000" }
        confirmed_at {Date.today}
    end
    
end