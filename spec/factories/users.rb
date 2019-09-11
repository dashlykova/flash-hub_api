FactoryBot.define do
  factory :user do
    email { "julie@dash.se" }
    password { "password" }
    password_confirmation { "password" }
  end
end 