class EmailProcessor
  attr_reader :email

  def initialize(email)
    @email = email
  end

  def process
    puts "HERE"
    p email.as_json
    puts "HERE"
  end
end
