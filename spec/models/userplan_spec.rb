require 'rails_helper'

RSpec.describe Userplan, type: :model do
  require 'rails_helper'

  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:curriculum_id) }
end
