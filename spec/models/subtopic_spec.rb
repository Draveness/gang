require 'rails_helper'

RSpec.describe Subtopic, type: :model do
  it { is_expected.to validate_presence_of(:content) }
  it { is_expected.to validate_length_of(:content).is_at_most(100) }
  it { is_expected.to belong_to(:topic) }
end
