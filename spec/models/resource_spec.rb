require 'rails_helper'

RSpec.describe Resource, type: :model do

  it { should validate_presence_of(:name) }
  it { should have_valid(:name).when("Example Resource") }
  it { should_not have_valid(:name).when(nil, "") }

  it { should validate_presence_of(:source) }
  it { should have_valid(:source).when("Example Source") }
  it { should_not have_valid(:source).when(nil, "") }

  it { should validate_presence_of(:assignment_id) }
end
