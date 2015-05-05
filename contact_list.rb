require_relative 'contact'
require_relative 'contact_database'
require 'pry'

class ContactList

  def initialize
    ARGV << 'help' if ARGV.empty?
    @command = ARGV.shift.downcase
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

  def get_info
    puts "Enter new contact info:"
    puts "email >"
    # binding.pry
    email = STDIN.gets.chomp
    #if Contact.exists? #How to check for this : find(index)?
    puts "full name >"
    name = STDIN.gets.chomp
    {email:email,name:name}
  end

  def create_new
    info = get_info
    Contact.create(info[:email],info[:name])
  end

  def parse
    case @command
    when 'new'
      @database.write(create_new)
    when 'list'
      Contact.all
    when 'show'
      Contact.show(@parameters[1])
    when 'find'
      Contact.find(@parameters[1])
    when 'help'
      help
    else
      help
    end
  end

end

ContactList.new