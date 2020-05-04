
class Vigenere
    @@alphabet = 'abcdefghijklmnopqrstuvwxyz'

    def self.encode_letter(letter,key_letter)
        letter_num = @@alphabet.index(letter)
        key_letter_num = @@alphabet.index(key_letter)
        puts "letter: #{letter} | letter num: #{letter_num} | key: #{key_letter} | key num: #{key_letter_num}"

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
        times_key_repeated = message.length / key.length + 1
        key_message = (key * times_key_repeated)[0...message.length]

        encoded_message = ''
        for i in 0...message.length
            encoded_message += self.encode_letter(message[i],key_message[i])
        end

        return encoded_message
    end

    def self.decode(message,key)
        times_key_repeated = message.length / key.length + 1
        key_message = (key * times_key_repeated)[0...message.length]

        decoded_message = ''
        for i in 0...message.length
            decoded_message += decode_letter(message[i],key_message[i])
        end

        return decoded_message
    end
end