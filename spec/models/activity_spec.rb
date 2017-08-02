require 'rails_helper'

RSpec.describe Activity, type: :model do
  it { is_expected.to validate_presence_of(:time) }
  it { is_expected.to validate_presence_of(:content) }
  it { is_expected.to validate_length_of(:content).is_at_most(200) }
  it { is_expected.to validate_presence_of(:site_id) }
  it { is_expected.to validate_presence_of(:topic_id) }
end
