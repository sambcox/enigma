module Modifyer
  def new_character(character, movement)
    new_index = alphabet.index(character) + movement
    return alphabet[new_index] if new_index <= 26
    alphabet[new_index - 27]
  end

  def old_character(character, movement)
    old_index = alphabet.index(character) - movement
    return alphabet[old_index] if old_index >= 0
    alphabet[old_index + 27]
  end

  def encryption_movement(last_4, remainder)
    split_4 = last_4.split('')
    split_guide = [' ', 'e', 'n', 'd']
    final_movement = []
    split_4.each_with_index do |character, index|
      if (alphabet.index(character) - alphabet.index(split_guide[index])) >= 0
        final_movement << (alphabet.index(character) - alphabet.index(split_guide[index]))
      else
        final_movement << (alphabet.index(character) - alphabet.index(split_guide[index])) + 27
      end
    end
    final_movement.rotate(-remainder)
  end

  def key_recreator(movement, date)
    date_key = date_mover(date)
    without_date = movement.map.with_index do |movement_indv, index|
      movement_indv - date_key[index]
    end
    if without_date[0].to_s.length < 2
      key_recreated = without_date[0].to_s.prepend('0') if without_date[0].to_s.length < 2
    else
      key_recreated = without_date[0].to_s
    end
    without_date.each_with_index do |integer, index|
      next if index == 0
      next key_recreated << '0' if key_recreated.chars.last.to_i * 10 - 27 == integer
      next key_recreated << integer.to_s if key_recreated.chars.last == '0'
      integer += 27 until (key_recreated.chars.last.to_i == integer.digits.last && integer.digits.length > 1)
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