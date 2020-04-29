require_relative './ciphers/caesar'
require_relative './ciphers/railfence'
require 'tty-prompt'

prompt = TTY::Prompt.new
ciphers = %w(Caesar Railfence Placeholder)
exit_app = false

puts "welcome to CLIpto!"
until exit_app
    menu_choice = prompt.select("Choose an option:", %w(About Encode Decode Ciphers Exit))
    case menu_choice
    when "About"
        puts "you chose 'About' - this page is coming soon!"
    when "Encode"
        user_message = prompt.ask("Type your message: ")
        cipher = prompt.select("Choose a cipher to encrypt your message: ", ciphers)
        case cipher
        when "Caesar"
            message, num = Caesar.encode(user_message)
            puts "with a shift of #{num}, your secret message is: #{message}"
        when "Railfence"
            message, num = Railfence.encode(user_message)
            puts "Your rail number is #{num} and your secret message is: #{message}"
        else
            "Error: How did you even select this"
        end
    when "Decode"
        user_message = prompt.ask("Enter the message you'd like to decode: ")
        cipher = prompt.select("Which cipher was your message written with?", ciphers)
        case cipher
        when "Caesar"
            if prompt.yes?("Do you know the message's shift number?")
                shift_num = prompt.ask("What is the shift number? ")
                decoded_message = Caesar.decode(user_message,shift_num)
                puts "Your decoded message is:"
                puts decoded_message
            else
                decoded_message = Caesar.decode(user_message)
                puts "Your possible messages are:"
                puts decoded_message
            end
        when "Railfence"
            if prompt.yes?("Do you know the message's rail number?")
                rail_num = prompt.ask("What is the rail number? ")
                decoded_message = Railfence.decode(user_message,rail_num)
                puts "Your decoded message is: "
                puts decoded_message
            else
                decoded_message = Railfence.decode(user_message)
                puts "Your possible messages are: "
                puts decoded_message
            end
        else
            "Error: How did you even select this"
        end
    when "Ciphers"
        puts "you chose 'Ciphers' - this page is coming soon!"
    when "Exit"
        exit_app = true
        puts "Goodbye!"
    else 
        puts "Error: invalid option chosen"
    end
end