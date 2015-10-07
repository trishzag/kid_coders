require 'rails_helper'

RSpec.describe Grade, type: :model do

  it { should validate_presence_of(:name) }
  it { should have_valid(:name).when("Example Curriculum") }
  it { should_not have_valid(:name).when(nil, "") }

  it { should validate_presence_of(:user_id) }
  
  it { should validate_presence_of(:assignment_id) }
end
