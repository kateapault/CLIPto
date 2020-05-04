class Railfence

    def self.encode(message)
        stripped_message = message.scan(/\w+/).join('').downcase
        rail_num = rand(2..stripped_message.length/2)
        encoded_message_arr = [''] * rail_num
        rail_ind = 0
        direction_up = true
        for i in 0...stripped_message.length
            encoded_message_arr[rail_ind] += stripped_message[i]
            # puts "#{encoded_message_arr}"
            if rail_ind == rail_num -1                       # if at top rail
                rail_ind -= 1                                   # start going down again
                direction_up = false
            elsif rail_ind == 0                              # if at bottom rail
                rail_ind += 1                                   # start going up again
                direction_up = true
            elsif rail_ind < rail_num - 1 && direction_up    # if going up and ind below top rail
                rail_ind += 1
            else                                             # if going down and ind above bottom rail
                rail_ind -= 1
            end
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