require 'rails_helper'

RSpec.describe Group, type: :model do

  it { should have_many(:users) }

  it { should validate_presence_of(:name) }
  it { should have_valid(:name).when("K-5", "MS", "HS") }
  it { should_not have_valid(:name).when(nil, "", 8) }
end
