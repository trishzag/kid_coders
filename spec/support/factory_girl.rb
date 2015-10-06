require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "user#{n}" }
    sequence(:first_name) { |n| "First#{n}" }
    sequence(:last_name) { |n| "Last#{n}" }
    sequence(:email) { |n| "user_email#{n}@example.com" }
    sequence(:password) { |n| "password#{n}" }
    password_confirmation :password
  end
end
