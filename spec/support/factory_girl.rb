require 'factory_girl'

FactoryGirl.define do
  factory :user do

    sequence(:username) { |n| "user#{n}" }
    sequence(:first_name) { |n| "First#{n}" }
    sequence(:last_name) { |n| "Last#{n}" }
    sequence(:email) { |n| "user_email#{n}@example.com" }
    password "password"
    password_confirmation "password"
  end

  factory :assignment do
    sequence(:title) { |n| "title#{n}" }
    sequence(:curriculum_id)
  end

  factory :curriculum do
    sequence(:name) { |n| "Curriculum name#{n}" }
  end

  factory :grade do
    sequence(:name) { "Pass" || "Requires Work" }
    sequence(:user_id)
    sequence(:assignment_id)
  end

  factory :group do
    sequence(:name)
  end

  factory :content do
    sequence(:title) { |n| "Title#{n}" }
    sequence(:description) { |n| "Description#{n}" }
    sequence(:source) { |n| "Source#{n}" }
    sequence(:assignment_id)
  end

  factory :resource do
    sequence(:title) { |n| "Title#{n}" }
    sequence(:description) { |n| "Description#{n}" }
    sequence(:source) { |n| "Source#{n}" }
    sequence(:assignment_id)
  end

  factory :userplan do
    sequence(:user_id)
    sequence(:curriculum_id)
  end
end
