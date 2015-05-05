require_relative 'contact'
require_relative 'contact_database'

class Application

  def initialize()
    binding.pry
    ARGV << 'help' if ARGV.empty?
    @command = ARGV.unshift.downcase
    @parameters = ARGV
    @database = ContactDatabase.new
    parse
  end

  def help
    puts "Here is a list of available commands:"
    puts "  new  - Create a new contact"
    puts "  list - List all contacts"
    puts "  show - Show a contact"
    puts "  find - Find a contact"
  end

  def get_info()
    puts "Enter new contact info:"
    puts "email >"
    email = gets.chomp
    #if Contact.exists? #How to check for this : find(index)?
    puts "full name >"
    name = gets.chomp
    {email:email,name:name}
  end

  def create_new()
    info = get_info
    Contact.create(info[:email],info[:name])
  end

  def parse
    case @command
    when 'new'
      create_new
    when 'list'
      Contact.list
    when 'show'
      Contact.show(parameter[1])
    when 'find'
      Contact.find(parameter[1])
    when 'help'
      help
    else
      help
    end
  end

end