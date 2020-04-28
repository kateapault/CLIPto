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
                    encoded_ind = encoded_ind - 26
                end
                encoded_message += @@alphabet[encoded_ind]
            end
        end
        return [encoded_message,shift_num]
    end

    def self.decode() #str - message, optional # of shift
        # if optional # of shift, decodes message
        # else prints possible decodes for all letters
    end

end