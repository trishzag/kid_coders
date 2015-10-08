require 'rails_helper'

RSpec.describe Content, type: :model do

  it { should validate_presence_of(:title) }
  it { should have_valid(:title).when("Example Content") }
  it { should_not have_valid(:title).when(nil, "") }

  it { should validate_presence_of(:description) }
  it { should have_valid(:description).when("Example Description") }
  it { should_not have_valid(:description).when(nil, "") }

  it { should validate_presence_of(:source) }
  it { should have_valid(:source).when("Example Source") }
  it { should_not have_valid(:source).when(nil, "") }

  it { should validate_presence_of(:assignment_id) }
end
