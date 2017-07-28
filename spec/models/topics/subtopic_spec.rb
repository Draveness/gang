require 'rails_helper'

RSpec.describe Topics::Subtopic, type: :model do
  it { is_expected.to validate_presence_of(:content) }
  it { is_expected.to validate_presence_of(:topic_id) }
  it { is_expected.to belong_to(:topic) }
end
