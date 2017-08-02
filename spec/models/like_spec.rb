require 'rails_helper'

RSpec.describe Like, type: :model do
  it { is_expected.to validate_presence_of(:user1) }
  it { is_expected.to validate_presence_of(:user2) }
end
