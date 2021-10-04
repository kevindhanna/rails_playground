class EmailProcessor
  attr_reader :email

  def initialize(email)
    @email = email
  end

  def process
    p email.as_json
  end
end
