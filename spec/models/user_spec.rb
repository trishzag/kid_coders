require 'rails_helper'

RSpec.describe User, type: :model do

  it { should validate_presence_of(:username) }
  it { should validate_length_of(:username).is_at_most(15) }

  it { should have_valid(:username).when("example-postink") }
  it { should_not have_valid(:username).when(nil, "") }

  it { should validate_presence_of(:first_name) }
  it { should validate_length_of(:first_name).is_at_most(20) }

  it { should have_valid(:first_name).when("Hannah Jane") }
  it { should_not have_valid(:first_name).when("Maria Cruz LaLuz De Jesus") }
  it { should_not have_valid(:first_name).when(nil) }

  it { should validate_presence_of(:last_name) }
  it { should validate_length_of(:last_name).is_at_most(25) }

  it { should have_valid(:last_name).when("Madison-Wellner") }
  it { should_not have_valid(:last_name).when("Madison-WellnerSherlockHolmes") }
  it { should_not have_valid(:last_name).when(nil) }

  it { should validate_presence_of(:password) }
  it { should validate_length_of(:password).is_at_least(8) }
  it { should validate_length_of(:password).is_at_most(15) }

  it { should have_valid(:password).when("password") }
  it { should have_valid(:password).when("spaghetti82d") }
  it { should_not have_valid(:password).when(nil, "break", "98375P") }

  it { should have_valid(:email).when("casey@inkedgirl.com") }
  it { should have_valid(:email).when(nil, "") }

  describe "#admin?" do
    it "is not an admin if admin is false " do
      user = FactoryGirl.create(:user, admin: false)
      expect(user.admin?). to eq(false)
    end

    it "is an admin if the admin is true" do
      user = FactoryGirl.create(:user, admin: true)
      expect(user.admin?).to eq(true)
    end
  end
end
