require 'pry'

require_relative 'contact'

# Interfaces between a user and their contact list. Reads from and writes to standard I/O.
class ContactList
  # TODO: Implement user interaction. This should be the only file where you use `puts` and `gets`.
  if ARGV.empty?
    puts "  Here is a list of available commands:"
    puts "      new     - Create a new contact"
    puts "      list    - List all contacts"
    puts "      show    - Show a contact"
    puts "      search  - Search contacts"

  elsif ARGV[0] == "list"
    #Display the people in the contact list
    Contact.all.each do |row|
      puts "#{row[0]}: #{row[1]} (#{row[2]})"
    end
    puts "---"
    puts "#{Contact.all.count} records total"

  elsif ARGV[0] == "new"
    #Add a new contact
    puts "Enter the name of the contact"
    name = STDIN.gets.chomp
    puts "Enter email address of the contact"
    email = STDIN.gets.chomp
    puts "Enter your phone numbers in the following format"
    puts "house,999-999-9999,mobile,777-777-7777"

    if Contact.create(name,email)
      puts "Contact successfully added"
    else
      puts "Email address already exists!"
    end

  elsif ARGV[0] == "show"
    #Show contact details
    row = Contact.find(ARGV[1])

    begin
      raise StandardError, "Contact cannot be found!" if row == nil
      puts "#{row[0]}: #{row[1]} (#{row[2]})"
    rescue Exception => e
      puts e.message
    end

  elsif ARGV[0] == "search"
    #search for a user   
    results = Contact.search(ARGV[1]).each do |row|
      puts "#{row[0]}: #{row[1]} (#{row[2]})"
    end

    puts "---"
    puts "#{results.count} records total"
  
  end

end
