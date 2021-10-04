class MailController < Griddler::EmailsController
  before_action :print_stuff

  def print_stuff
    puts "BEFORE"
    puts params
    puts "BEFORE"
  end
end
