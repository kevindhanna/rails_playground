class ForwardsMailbox < ApplicationMailbox
  InvalidChecksum = Class.new(StandardError)

  def process
    proxied_email = Email.new(
      subject: mail.subject,
      to: "kevin@contact.xyz",
      from: "forwards@email.contact-staging.com",
      reply_to: "forwards@email.contact-staging.com",
      html: mail.html_part.decoded,
      attachments: mail.attachments
    )
    MailClients::Mailgun.new(proxied_email).deliver_later
  end
end
