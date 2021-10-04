class MailController < Griddler::EmailsController
  before_action :do_stuff

  def do_stuff
    raw_request = request.raw_post
    File.open('./raw', 'w') { |f|
      f.write(raw_request)
    }
    File.open('./json', 'w') { |f|
      f.write(request.as_json)
    }
    File.open('./params', 'w') { |f|
      f.write(params.as_json)
    }
  end
end
