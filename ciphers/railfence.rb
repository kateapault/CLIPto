class Railfence

    def self.encode(message)
        stripped_message = message.scan(/\w+/).join('').downcase
        rail_num = rand(2..stripped_message.length/2)
        encoded_message_arr = [''] * rail_num
        for i in 0...stripped_message.length
            letter = stripped_message[i]
            rail = i % rail_num
            encoded_message_arr[rail] += letter
        end
        return [encoded_message_arr.join(''), rail_num]
    end

    def self.decode(message,rail_num=nil)
        if rail_num
            
        else 

        end

        return 'decoding process in progress'
    end
end