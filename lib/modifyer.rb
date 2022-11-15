# frozen_string_literal: true

module Modifyer
  def new_character(character, movement)
    return character unless alphabet.include?(character)

    new_index = (alphabet.index(character) + movement) % 27
    alphabet[new_index]
  end

  def old_character(character, movement)
    return character unless alphabet.include?(character)

    old_index = ((alphabet.index(character) - movement) + 27) % 27
    alphabet[old_index]
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

      integer += 27 until key_recreated.chars.last.to_i == integer.digits.last && integer.digits.length > 1
      key_recreated << (integer.digits.first.to_s)
    end
    key_recreated
  end

  def code_breaker(string, key)
    string.downcase.chars.map.with_index do |letter, index|
      old_character(letter, key[index % 4])
    end.join
  end
end
