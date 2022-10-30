# frozen_string_literal: true

desc 'Sends newsletter to required users'
task :send_newsletter => [:environment] do
  [User.last].each { |user| UserMailer.with(user: user).newsletter.deliver_now }
end
