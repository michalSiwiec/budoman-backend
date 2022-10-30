# frozen_string_literal: true

desc 'Sends newsletter to required users'
task :send_newsletter => [:environment] do
  Newsletter.all.each do |newsletter|
    UserMailer.with(newsletter: newsletter).newsletter.deliver_now
  end
end
