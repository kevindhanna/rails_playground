class MailController < Griddler::EmailsController
  before_action :do_stuff

  def do_stuff
    puts "Raw Post"
    p request.raw_post
    puts "end"
    puts "params"
    p params
    puts "end"
  end
end
