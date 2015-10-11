require 'factory_girl'

FactoryGirl.define do
  factory :user do

    sequence(:username) { |n| "user#{n}" }
    sequence(:first_name) { |n| "First#{n}" }
    sequence(:last_name) { |n| "Last#{n}" }
    sequence(:email) { |n| "user_email#{n}@example.com" }
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
    sequence(:title) { |n| "title#{n}" }
    sequence(:curriculum_id)

    factory :graded_assignment do
      after(:create) { create(:grade, assignment: assignment) }
    end

    factory :assignment_with_contents_resources do
      after(:create) do |assignment|
        5.times { create(:content, assignment: assignment) }
        5.times { create(:resource, assignment: assignment) }
      end
    end

    factory :graded_assignment_with_contents_resources do
      after(:create) do |assignment|
        5.times { create(:content, assignment: graded_assignment) }
        5.times { create(:resource, assignment: graded_assignment) }
      end
    end

    factory :related_assignments do
      after(:create) do |assignment|
        10.times { create(:graded_assignment_with_contents_resources) }
      end
    end
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
