class MailerJob < ApplicationJob
  queue_as :default

  def perform(client_klass, **args)
    email = Email.new(**args)
    client_klass.constantize.new(email).deliver
  end
end
