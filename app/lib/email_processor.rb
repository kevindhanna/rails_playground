class EmailProcessor
  attr_reader :email

  def initialize(email)
    @email = email
  end

  def process
    puts "Processing"
  end
end
