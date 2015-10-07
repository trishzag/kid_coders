require 'rails_helper'

RSpec.describe Curriculum, type: :model do

  it { should have_many(:assignments) }

  it { should validate_presence_of(:name) }
  it { should have_valid(:name).when("Example Curriculum") }
  it { should_not have_valid(:name).when(nil, "") }
end
