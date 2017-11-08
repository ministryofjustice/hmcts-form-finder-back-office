require 'rails_helper'

RSpec.describe DeviseMailer, type: :mailer do
  describe '#reset_password_instructions' do
    let(:user) { create :user, first_name: 'Some', last_name: 'one' }
    let(:mail) { described_class.reset_password_instructions user, 'nEAanath7ath7at8aWF' }

    it 'sets the template' do
      expect(mail.govuk_notify_template)
        .to eq Settings.reset_password_notify_template
    end

    it 'personalises the email' do
      expect(mail.govuk_notify_personalisation)
        .to eq(
          email_subject: 'Password reset',
          recipient_name: 'Some one',
          reset_link:
          'http://localhost:3000/users/password/edit?reset_password_token=nEAanath7ath7at8aWF',
          hours_to_expire: '4'
        )
    end

    it 'sets the To address of the email' do
      expect(mail.to).to include user.email
    end
  end
end
