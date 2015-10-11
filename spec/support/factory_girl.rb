require 'factory_girl'
require 'faker'

FactoryGirl.define do
  factory :user do
    sequence(:username) { "#{Faker::Lorem.characters(12)}" }
    sequence(:first_name) { "#{Faker::Lorem.characters(8)}" }
    sequence(:last_name) { "#{Faker::Lorem.characters(10)}" }
    sequence(:email) { "#{Faker::Lorem.characters(6)}@#{Faker::Lorem.characters(6)}.com" }
    password "password"
    password_confirmation "password"

    factory :user_with_userplan do
      after (:create) do |user|
        create(:userplan_with_one_curriculum, user: user)
      end
    end

    factory :user_with_two_userplans do
      after (:create) do |user|
        2.times { create(:userplan_with_curricula, user: user) }
      end
    end
  end

  factory :assignment do
    sequence(:title) { "#{Faker::Lorem.characters(12)}" }
    sequence(:curriculum_id)

    factory :assignment_with_contents_resources do
      after(:create) do |assignment|
        5.times { create(:content, assignment: assignment) }
        5.times { create(:resource, assignment: assignment) }
      end
    end
  end

  factory :curriculum do
    sequence(:name) { "#{Faker::Lorem.characters(12)}" }
  end

  factory :grade do
    sequence(:name) { "Pass" || "Requires Work" }
    sequence(:user_id)
    sequence(:assignment_id)

    factory :graded_assignment_with_contents_resources do
      after(:create) { create(:assignment_with_contents) }
    end
  end

  factory :group do
    sequence(:name)
  end

  factory :content do
    sequence(:title) { "#{Faker::Lorem.characters(12)}" }
    sequence(:description) { "#{Faker::Lorem.characters(25)}" }
    sequence(:source) { "#{Faker::Lorem.characters(12)}" }
    sequence(:assignment_id)
  end

  factory :resource do
    sequence(:name) { "#{Faker::Lorem.characters(12)}" }
    sequence(:source) { "#{Faker::Lorem.characters(12)}" }
    sequence(:assignment_id)
  end

  factory :userplan do
    sequence(:user_id)
    sequence(:curriculum_id)

    factory :userplan_with_one_curriculum do
      after (:create) do |userplan|
        create(:curriculum)
      end
    end

    factory :userplan_with_curricula do
      after (:create) do |userplan|
        2.times { create(:curriculum) }
      end
    end
  end
end
