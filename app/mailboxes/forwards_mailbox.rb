class ForwardsMailbox < ApplicationMailbox
  def process
    puts "MAIL"
    p mail
    puts "MAIL TEXT PART"
    puts mail.text_part
    puts "MAIL HTML PART"
    puts mail.html_part
    puts "to"
    p mail.to
    puts "from"
    p mail.from
    puts "source"
    p inbound_email.source
  end
end
