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
    response = self.class.client.post("#{ROOT_URL}/messages", form: request_body)

    json = JSON.parse(response.body)

    raise BadResponse, json['message'] if response.status >= 300

    response
  end

  def deliver_later
    MailerJob.perform_later(
      self.class.to_s,
      from: email.from,
      to: email.to,
      reply_to: email.reply_to,
      subject: email.subject,
      html: email.html,
      attachments: email.attachments
    )
  end

  def self.client
    HTTP.basic_auth(user: 'api', pass: ENV['MAILGUN_API_KEY'])
  end

  private

  def request_body
    base_params = {
      from: email.from,
      to: email.to,
      html: email.html,
      subject: email.subject,
      'h:Reply-To' => email.reply_to
    }

    base_params[:attachment] = attachments if attachments

    base_params
  end

  def attachments
    safe_attachments = Array(email.attachments).compact
    return nil unless safe_attachments.present?

    @attachments ||= safe_attachments.map do |attachment|
      data = HTTP.follow.get(attachment[:url])

      next if data.content_length.to_i.zero? || data.content_length.to_i > MAX_ATTACHMENT_SIZE

      HTTP::FormData::File.new(
        StringIO.new(data.body),
        filename: attachment[:filename],
        content_type: attachment[:content_type]
      )
    end.compact
  end
end
