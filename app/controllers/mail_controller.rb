class MailController < Griddler::EmailsController
  before_action :print_stuff

  def print_stuff
    puts "BEFORE"
    puts params.as_json
    puts "BEFORE"
  end
end
