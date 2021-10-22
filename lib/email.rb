class Email
  ATTRS = %i[
    from
    to
    reply_to
    cc
    html
    subject
    template_name
    template_id
    template_variables
    attachments
    idempotency_object
  ].freeze

  attr_accessor(*ATTRS)
  attr_reader :client_class

  def initialize(attrs)
    attrs.each do |k, v|
      instance_variable_set("@#{k}", v)
    end

    @from ||= default_from
    @reply_to ||= 'help@email.contact-staging.com'
    @client_class ||= MailClients::Mailgun
    @to = Array(to)
    @cc = Array(cc)
    @attachments = Array(attachments).compact
  end

  def deliver
    client.deliver
  end
  alias deliver_now deliver

  def deliver_later
    client.deliver_later
  end

  private

  def client
    client_class.new(self)
  end

  def default_from
    "Contact <help@email.contact-staging.com>"
  end
end
