require 'date'
require_relative 'base_layer'

class Enigma
  include BaseLayer
  def encrypt(to_be_encrypted, key = random_key, date = Date.today.to_s.delete('-'))
    key_made = key_maker(key, date)
    as_arr = to_be_encrypted.chars
    encrypted = []
    as_arr.each_with_index do |letter, index|
      encrypted << alphabet[alphabet.index(letter) + key_made[0]] if (index % 4) == 0
      encrypted << alphabet[alphabet.index(letter) + key_made[1]] if (index % 4) == 1
      encrypted << alphabet[alphabet.index(letter) + key_made[2]] if (index % 4) == 2
      encrypted << alphabet[alphabet.index(letter) + key_made[3]] if (index % 4) == 3
    end
  end
end