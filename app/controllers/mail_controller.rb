class MailController < Griddler::EmailsController
  before_action :print_stuff

  def print_stuff
    puts "BEFORE"
    puts request.raw_post
    puts "BEFORE"
  end
end
