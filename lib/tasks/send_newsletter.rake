# frozen_string_literal: true

desc 'Sends newsletter to required users'
task :send_newsletter => [:environment] do
  Newsletter.all.each do |newsletter|
    NewsletterMailer.with(newsletter: newsletter).send_newsletter.deliver_later
  end
end
