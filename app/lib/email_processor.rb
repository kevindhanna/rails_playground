class EmailProcessor
  attr_reader :email

  def initialize(email)
    @email = email
  end

  def process
    puts "class", email.class
    puts "text:", email.raw_text
  end
end
