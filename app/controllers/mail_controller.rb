class MailController < Griddler::EmailsController
  before_action :do_stuff

  def do_stuff
    File.open('raw', 'w') { |f|
      f.write(request.raw_post)
    }
    File.open('json', 'w') { |f|
      f.write(request.as_json)
    }
    File.open('params', 'w') { |f|
      f.write(params.as_json)
    }
  end
end
