require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "user#{n}"}
    sequence(:email) { |n| "user_email#{n}@example.com" }
    sequence(:password) { |n| "password#{n}"}
    password_confirmation :password
  end
end
