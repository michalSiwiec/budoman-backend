# frozen_string_literal: true

every 1.minute, mailto: 'siwiec.michal724@gmail.com' do
  rake 'send_newsletter'
end
