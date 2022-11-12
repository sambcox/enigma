require 'time'
require_relative 'base_layer'
require_relative 'modifyer'

class Enigma
  include BaseLayer
  include Modifyer

  def encrypt(to_be_encrypted, key = random_key, date = today_date)
    key_made = key_maker(key, date)
    encrypted = []
    to_encrypt_split(to_be_encrypted).each_with_index do |letter, index|
      encrypted << new_character(letter, key_made[index % 4])
    end
    {encryption: encrypted.join, key: key, date: date}
  end

  def decrypt(to_be_decrypted, key, date = today_date)
    key_made = key_maker(key, date)
    to_decrypt_split = to_be_decrypted.downcase.chars
    decrypted = []
    to_decrypt_split.each_with_index do |letter, index|
      decrypted << old_character(letter, key_made[index % 4])
    end
    {decryption: decrypted.join, key: key, date: date}
  end

  def crack(encryption, date = today_date)
    remainder = encryption.length % 4
    encryption_ending = encryption.split('').last(4).join
    movement_table = encryption_movement(encryption_ending, remainder)
    key_1 = key_recreator(movement_table, date)
    decryp_first = decrypt(encryption, key_1, date)
    return decryp_first if decryp_first[:decryption] == code_breaker(encryption, movement_table)
    new_table = movement_table
    new_table[0] += 27 until decrypt(encryption, key_recreator(new_table, date), date)[:decryption] == code_breaker(encryption, movement_table)
    decrypt(encryption, key_recreator(new_table, date), date)
  end
end