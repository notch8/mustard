class UserMailer < ActionMailer::Base
  default :from => "mustard@notch8.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.failure.subject
  #
  def failure(test_case)
    @test_case = test_case
    mail :to => "rgkaufman@gmail.com"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.success.subject
  #
  def success(test_case)
    @test_case = test_case
    mail :to => "rgkaufman@gmail.com"
  end
end
