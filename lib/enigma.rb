require 'date'
require_relative 'base_layer'

class Enigma
  include BaseLayer
  def encrypt(to_be_encrypted, key, date = Date.today.to_s.delete('-'))
    date_mover(date)
    key_split = key.split('')
    key_1 = (key_split.first(2).join.to_i) + date_mover.first
    as_arr = to_be_encrypted.chars
    encrypted = []
    as_arr.each_with_index do |letter, index|
      encrypted << alphabet[alphabet.index(letter) + key_1] if (index % 4) == 0
      encrypted << alphabet[alphabet.index(letter) + key_1] if (index % 4) == 1
      encrypted << alphabet[alphabet.index(letter) + key_1] if (index % 4) == 2
      encrypted << alphabet[alphabet.index(letter) + key_1] if (index % 4) == 3
    end
  end
end