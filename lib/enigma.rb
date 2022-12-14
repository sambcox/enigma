# frozen_string_literal: true

require 'time'
require_relative 'base_layer'
require_relative 'modifyer'

class Enigma
  include BaseLayer
  include Modifyer

  def encrypt(to_be_encrypted, key = random_key, date = today_date)
    key_made = key_maker(key, date)
    { encryption: code_maker(to_be_encrypted, key_made, 1), key: key, date: date }
  end

  def decrypt(to_be_decrypted, key, date = today_date)
    key_made = key_maker(key, date)
    { decryption: code_maker(to_be_decrypted, key_made, -1), key: key, date: date }
  end

  def crack(encryption, date = today_date)
    encryption_ending = encryption.chars.last(4)
    movement_table = encryption_movement(encryption_ending, encryption.length % 4)
    key1 = key_recreator(movement_table, date)
    decryp_first = decrypt(encryption, key1, date)
    return decryp_first if decryp_first[:decryption] == code_maker(encryption, movement_table, -1)

    new_table = movement_table
    new_table[0] += 27 until decrypt(encryption, key_recreator(new_table, date),
                                     date)[:decryption] == code_maker(encryption, movement_table, -1)
    decrypt(encryption, key_recreator(new_table, date), date)
  end
end
