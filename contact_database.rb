## TODO: Implement CSV reading/writing
require 'csv'

class ContactDatabase
  def initialize(filename='contacts.csv')
    @filename = filename
  end

  def read
    contacts = CSV.read(@filename)
  end

  def write(contact)
    CSV.open(@filename,'w') do |file|
      file << contact.to_a
    end
  end

end

