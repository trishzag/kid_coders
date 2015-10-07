require 'rails_helper'

RSpec.describe Assignment, type: :model do
  # 
  # describe "validation of unique index" do
  #   subject { Assignment.new(title: "title", curriculum_id: 8) }
  #   it { should validate_uniqueness_of(:title).scoped_to(:curriculum_id) }
  # end

  it { should validate_presence_of(:title) }
  it { should have_valid(:title).when("Example Title") }
  it { should_not have_valid(:title).when(nil, "") }

  it { should have_valid(:curriculum_id).when(8) }
  it { should_not have_valid(:curriculum_id).when("Maria Cruz") }
  it { should_not have_valid(:curriculum_id).when(nil, "") }

  it { should belong_to(:curriculum) }
end
