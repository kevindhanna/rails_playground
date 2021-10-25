class MailClients::Mailgun
  BadResponse = Class.new(StandardError)

  API_ROOT = "https://api.eu.mailgun.net/v3/email.contact-staging.com".freeze
  SANDBOX_API_ROOT = "https://api.mailgun.net/v3/email.contact-staging.com".freeze
  ROOT_URL = API_ROOT
  MAX_ATTACHMENT_SIZE = 25.megabytes

  attr_reader :email

  def initialize(email)
    @email = email
  end

  def deliver
    response = self.class.client.send_message("email.contact-staging.com", message)

    json = JSON.parse(response.body)

    raise BadResponse, json['message'] if response.status >= 300

    response
  end

  def self.client
    Mailgun::Client.new(ENV['MAILGUN_API_KEY'], 'api.eu.mailgun.net')
  end

  private

  def message
    message_obj = Message::MessageBuilder.new()
      .from(email.from)
      .add_recipient(to: email.to, { first: "Kevin", last: "Hanna" })
      .body_html(email.html)
      .subject(email.subject)
      .reply_to(email.reply_to)

    email.attachments.each do
      message_obj.add_attachment(attachment)
    end

    message_obj
  end
end
