class User < ApplicationRecord
  enum gender: %i[male female]

  validates :nickname, presence: true
  validates :wechat, presence: true
  validates :mobile, length: { is: 11 }, allow_blank: true
  validates :mobile, uniqueness: true, allow_blank: true
  validates :mobile, format: { with: /\d{11}/ }, allow_blank: true

  before_save :update_completed_flag

  private

  def update_completed_flag
    self.completed = %i[mobile gender name school grade major].reduce(true) { |memo, attr| memo && send(attr).present? }
  end
end
