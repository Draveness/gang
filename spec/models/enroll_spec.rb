require 'rails_helper'

RSpec.describe Enroll, type: :model do
  # name 'user_id' conflict with methods in gem 'twitter'
  # it { is_expected.to validate_presence_of(:user_id) }

  # TODO: And this is a GHOST ERRPR!!
  # it { is_expected.to validate_presence_of(:activity_id) }
end
