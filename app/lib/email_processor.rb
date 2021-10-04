class EmailProcessor
  attr_reader :email

  def initialize(email)
    @email = email
  end

  def process
    puts "HERE"
    thing = {
      subject: email.subject,
      to: email.to,
      from: email.from,
      reply_to: email.from,
      template_name: 'proxy_email',
      template_variables: {
        body: email.raw_text
      },
      attachments: email.attachments
    }

    p thing
  end
end
