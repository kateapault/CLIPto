
class Vigenere
    @@alphabet = 'abcdefghijklmnopqrstuvwxyz'

    def self.sanitize_string(message)
        clean_message = ''

        for i in 0...message.length
            if @@alphabet.include? message[i].downcase()
                clean_message += message[i].downcase()
            end
        end
        return clean_message
    end

    def self.encode_letter(letter,key_letter)
        letter_num = @@alphabet.index(letter)
        key_letter_num = @@alphabet.index(key_letter)
        # puts "letter: #{letter} | letter num: #{letter_num} | key: #{key_letter} | key num: #{key_letter_num}"

        encoded_letter_num = letter_num + key_letter_num + 1
        encoded_letter_num > 26 ? encoded_letter_num -= 26 : encoded_letter_num
        return @@alphabet[encoded_letter_num - 1]
    end

    def self.decode_letter(encoded_letter, key_letter)
        encoded_letter_num = @@alphabet.index(encoded_letter)
        key_letter_num = @@alphabet.index(key_letter)

        decoded_letter_num = encoded_letter_num - key_letter_num + 1
        decoded_letter_num <= 0 ? decoded_letter_num += 26 : decoded_letter_num
        return @@alphabet[decoded_letter_num - 1]
    end

    def self.encode(message,key)
        clean_message = self.sanitize_string(message)
        times_key_repeated = clean_message.length / key.length + 1
        key_message = (key * times_key_repeated)[0...clean_message.length]

        encoded_message = ''
        for i in 0...clean_message.length
            encoded_message += self.encode_letter(clean_message[i],key_message[i])
        end

        return encoded_message
    end

    def self.decode(message,key)
        clean_message = self.sanitize_string(message)
        times_key_repeated = clean_message.length / key.length + 1
        key_message = (key * times_key_repeated)[0...clean_message.length]

        decoded_message = ''
        for i in 0...clean_message.length
            decoded_message += decode_letter(clean_message[i],key_message[i])
        end

        return decoded_message
    end
end