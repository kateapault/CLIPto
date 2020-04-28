class Caesar
    # simple encodes vs multiple? simple - convert to all lowercase & strip spaces
    # new with what?

    @@alphabet = 'abcdefghijklmnopqrstuvwxyz'

    def self.encode(message) # takes in str message, outputs array of encoded message and # shift
        shift_num = rand(25) + 1
        # convert message to ll lowercase and no spaces or punctuation
        # how to deal with numbers??? strip for now
        encoded_message = ''
        for i in 0...message.length
            char = message[i].downcase
            if @@alphabet.include? char
                ind = @@alphabet.index(char)
                encoded_ind = ind + shift_num
                if encoded_ind > 25
                    encoded_ind -= 26
                end
                encoded_message += @@alphabet[encoded_ind]
            end
        end
        return [encoded_message,shift_num]
    end

    def self.decode(message,num=nil) #str - message, optional # of shift
        if num 
            decoded_message = ''
            for i in 0...message.length
                char = message[i]
                char_ind = @@alphabet.index(char)
                decoded_ind = char_ind - num.to_i
                if decoded_ind < 0
                    decoded_ind += 26
                end
                decoded_message += @@alphabet[decoded_ind]
            end
            return decoded_message
        else
            possible_messages = {}
            for i in 0...message.length
                char = message[i]
                char_ind = @@alphabet.index(char)
                for j in 0..25
                    encoded_ind = char_ind - j
                    if encoded_ind > 25
                        encoded_ind += 26
                    end
                    if possible_messages[j]
                        possible_messages[j] += @@alphabet[encoded_ind]
                    else
                        possible_messages[j] = @@alphabet[encoded_ind]
                    end
                end
            end
            return possible_messages.values
        end
    end
end