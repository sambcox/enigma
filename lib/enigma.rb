require 'time'
require_relative 'base_layer'
require_relative 'modifyer'

class Enigma
  include BaseLayer
  include Modifyer
  def encrypt(to_be_encrypted, key = random_key, date = today_date)
    key_made = key_maker(key, date)
    as_arr = to_be_encrypted.downcase.chars
    encrypted = []
    as_arr.each_with_index do |letter, index|
      encrypted << new_character(letter, key_made[index % 4])
    end
    {encryption: encrypted.join, key: key, date: date}
  end
end