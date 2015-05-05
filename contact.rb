require 'pp'

class Contact

  attr_accessor :name, :email

  def initialize(name, email)
    # TODO: assign local variables to instance variables
    @name = name
    @email = email
  end

  def to_s
    # TODO: return string representation of Contact
  end

  def to_a
    [@email,@name]
  end

  ## Class Methods
  class << self
    def create(name, email)
      # TODO: Will initialize a contact as well as add it to the list of contacts
      new(name, email)
    end

    def find(index)
      # TODO: Will find and return contact by index

    end

    def all
      # TODO: Return the list of contacts, as is
      ContactDatabase.new.formatted_list
    end

    def show(id)
      # TODO: Show a contact, based on ID
    end

  end

end