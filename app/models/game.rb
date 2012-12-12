class Game < ActiveRecord::Base
  has_many :moves, dependent: :destroy

  validate :invite_settings

  def invite_settings
    if !self.public? && self.invite.blank?
      errors.add(:base, "Private games require an invitation.")
    end
  end

  after_create :send_invite, :if => :invited?

  def self.public
   where public: true
  end

  def invited?
    self.invite.present?
  end

  def send_invite
    GameMailer.invite(self).deliver
  end
end
