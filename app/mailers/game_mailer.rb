class GameMailer < ActionMailer::Base
  default from: "instachess@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.game_mailer.invite.subject
  #
  def invite(game)
    @game = game
    mail to: game.invite.strip, subject: "You've been challenged to play chess!"
  end
end
