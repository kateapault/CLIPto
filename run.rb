require_relative 'caesar'

puts "welcome to CLIpto!"

puts "example of Caesar encryption:"
message, num = Caesar.encode('Here is an example message!')
puts "with a shift of #{num}, your secret message is: #{message}"
