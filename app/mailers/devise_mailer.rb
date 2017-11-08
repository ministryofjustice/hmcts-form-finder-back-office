class DeviseMailer < Devise::Mailer
  # gives access to all helpers defined within `application_helper`.
  # helper :application
  # Optional. eg. `confirmation_url`
  include Devise::Controllers::UrlHelpers

  def reset_password_instructions(record, token, _opts = {})
    set_template(Settings.reset_password_notify_template)

    set_personalisation(
      email_subject: 'Password reset',
      recipient_name: record.full_name,
      reset_link: edit_password_url(record, reset_password_token: token),
      hours_to_expire: '4'
    )

    mail(to: record.email)
  end
end
