require 'faker'# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
5.times do
curriculum_attributes = { name: "#{Faker::Lorem.characters(20)}" }
  Curriculum.create(curriculum_attributes)
end

5.times do
group_attributes = { name: "#{Faker::Lorem.characters(15)}" }
  Group.create(group_attributes)
end

20.times do
user_attributes = {
  first_name: "#{Faker::Lorem.characters(12)}",
  last_name: "#{Faker::Lorem.characters(15)}",
  username: "#{Faker::Lorem.characters(15)}",
  email: "#{Faker::Lorem.characters(8)}@#{Faker::Lorem.characters(8)}.com",
  password: "#{Faker::Lorem.characters(15)}"
}
  User.create(user_attributes)
end

50.times do
assignment_attributes = {
  title: "#{Faker::Lorem.characters(25)}",
  curriculum_id: "#{rand(5)}"
}
  Assignment.create(assignment_attributes)
end

250.times do
content_attributes = {
  title: "#{Faker::Lorem.characters(25)}",
  description: "#{Faker::Lorem.paragraphs($nb = 6)}",
  source: "#{Faker::Lorem.characters(10)}",
  assignment_id: "#{rand(50)}"
}
  Content.create(content_attributes)
end

150.times do
resource_attributes = {
  name: "#{Faker::Lorem.characters(25)}",
  source: "http://#{Faker::Lorem.characters(10)}.com",
  assignment_id: "#{rand(50)}"
}
  Resource.create(resource_attributes)
end

50.times do
passing_grade_attributes = {
  name: "Pass",
  user_id: "#{rand(10)}",
  assignment_id: "#{rand(50)}"
}
  Grade.create(passing_grade_attributes)
end

50.times do
incomplete_grade_attributes = {
  name: "Needs Work",
  user_id: "#{rand(10)}",
  assignment_id: "#{rand(50)}"
}
  Grade.create(incomplete_grade_attributes)
end

25.times do
userplan_attributes = {
  user_id: "#{rand(10)}",
  curriculum_id: "#{rand(5)}"
}
  Userplan.create(userplan_attributes)
end
