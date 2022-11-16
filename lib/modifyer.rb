# frozen_string_literal: true

module Modifyer
  def return_character(character, movement, operator)
    return character unless alphabet.include?(character)

    return_index = (alphabet.index(character) + (movement * operator) + 27) % 27
    alphabet[return_index]
  end

  def code_maker(to_encrypt, key_made, operator)
    to_encrypt.downcase.chars.map.with_index do |letter, index|
      return_character(letter, key_made[index % 4], operator)
    end.join
  end

  def encryption_movement(last_4, remainder)
    split_guide = [' ', 'e', 'n', 'd']
    final_movement = last_4.map.with_index do |character, index|
      (alphabet.index(character) - alphabet.index(split_guide[index]) + 27) % 27
    end
    final_movement.rotate(-remainder)
  end

  def key_recreator(movement, date)
    without_date = movement.map.with_index do |movement_indv, index|
      movement_indv - date_mover(date)[index]
    end
    without_date[0] = without_date[0].to_s.prepend('0') if without_date[0].to_s.length < 2
    key_recreated = without_date[0].to_s
    without_date.each_with_index do |integer, index|
      next if index.zero?
      next key_recreated << '0' if key_recreated.chars.last.to_i * 10 - 27 == integer
      next key_recreated << integer.to_s if key_recreated.chars.last == '0'

      until key_recreated.chars.last.to_i == integer.digits.last && integer.digits.length > 1 || integer > 200 do
        integer += 27
        require 'pry'; binding.pry
      end
      key_recreated << (integer.digits.first.to_s)
    end
    key_recreated
  end
end
