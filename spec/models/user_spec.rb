require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to validate_presence_of(:nickname) }
  it { is_expected.to validate_presence_of(:wechat) }
  it { is_expected.to validate_uniqueness_of(:mobile) }
  it { is_expected.to define_enum_for(:gender).with(%i[male female]) }

  it { is_expected.to allow_value('13000000000').for(:mobile) }
  it { is_expected.not_to allow_values('1300000000a', '130000000011', '8888888888').for(:mobile) }

  context 'when completed personal info' do
    let(:incompleted_user) { create :incompleted_user }
    it 'updates completed flag to true' do
      expect(incompleted_user.completed?).to be_falsey
      incompleted_user.mobile = '13000000000'
      incompleted_user.gender = :male
      incompleted_user.name = 'Draven'
      incompleted_user.school = 'XiDian University'
      incompleted_user.grade = 'Freshman'
      incompleted_user.major = 'Software Engineering'
      incompleted_user.save
      expect(incompleted_user.completed?).to be_truthy
    end
  end

  it 'updates completed flag to false' do
    user = create :user
    expect(user.completed?).to be_truthy
    user.mobile = nil
    user.save
    expect(user.completed?).to be_falsey
  end
end
