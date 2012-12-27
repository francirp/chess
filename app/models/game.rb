class Game < ActiveRecord::Base
  has_many :moves, dependent: :destroy

  validate :invite_settings
  after_create :send_invite, :if => :invited?

  scope :public, -> { where(public: true) }
  
  def invite_settings
    if !self.public? && self.invite.blank?
      errors.add(:base, "Private games require an invitation.")
    end
  end

  def invited?
    self.invite.present?
  end

  def send_invite
    GameMailer.invite(self).deliver
  end
end
