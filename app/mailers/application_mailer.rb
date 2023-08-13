class ApplicationMailer < ActionMailer::Base
  default from: 'Sklep budowlany Budoman'
  layout 'mailer'

  private

  def send_email(recipient_email:, title:)
    mail(to: recipient_email, subject: title)
  end

  def attach_attachments(attachments_data_generator:)
    attachments_datas = attachments_data_generator.call
    attachments_datas.each do |attachment_data|
      file_name = attachment_data[:file_name]
      file_content = attachment_data[:content]

      attachments[file_name] = file_content
    end
  end
end
