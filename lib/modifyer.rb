module Modifyer
  def new_character(character, movement)
    new_index = alphabet.index(character) + movement
    return alphabet[new_index] if new_index <= 26
    alphabet[new_index - 27]
  end

  def old_character(character, movement)
    old_index = alphabet.index(character) - movement
    return alphabet[old_index] if old_index >=0
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
end