require 'pry'

require_relative 'contact'

# Interfaces between a user and their contact list. Reads from and writes to standard I/O.
class ContactList
  # TODO: Implement user interaction. This should be the only file where you use `puts` and `gets`.
  if ARGV.empty?
    puts "Here is a list of available commands:"
    puts "  new     - Create a new contact"
    puts "  list    - List all contacts"
    puts "  show    - Show a contact"
    puts "  search  - Search contacts"
  elsif ARGV[0] == "list"
    #Display the people in the contact list
    m = Contact.all.inject(0) do |count,row|
      puts "#{row[0]} (#{row[1]})"
      count +=1
    end
    puts "---"
    puts "#{m} records total"
  elsif ARGV[0] == "new"
    #Add a new contact
    puts "Enter the name of the contact"
    name = STDIN.gets.chomp
    puts "Enter email address of the contact"
    email = STDIN.gets.chomp
    Contact.create(name,email)
  elsif ARGV[0] == "show"
    #Show contact details
  elsif ARGV[0] == "search"
    #search for a user
  end

end
