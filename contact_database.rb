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
    CSV.open(@filename,'a') do |file|
      # binding.pry
      file << contact.to_a.unshift(uid)
    end
  end

  def uid
    id = []
    unless read.nil?
      read.each { |contact| id << contact[0] }
    else
      id << ['1']
    end
    new_id = (id.max.to_i+1).to_s
  end

end