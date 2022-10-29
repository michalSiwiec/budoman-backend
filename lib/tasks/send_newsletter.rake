# frozen_string_literal: true

desc 'Sends newsletter to required users'
task :send_newsletter => [:environment] do
  User.last.update(name: 'TEST VALUE')
end
