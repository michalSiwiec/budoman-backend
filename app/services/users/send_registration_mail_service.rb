module Users
  class SendRegistrationMailService
    def initialize(email:, password:)
      @email = email
      @password = password
    end

    def call
      send_registration_mail
    end

    private

    def send_registration_mail
      UserMailer.with(email: @email,
                      password: @password).account_registered.deliver_later
    end
  end
end
