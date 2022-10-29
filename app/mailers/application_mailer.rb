# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'Sklep budowlany Budoman'
  layout 'mailer'
end
