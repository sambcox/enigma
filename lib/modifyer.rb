module Modifyer
  def new_character(character, movement)
    new_index = alphabet.index(character) + movement
    return alphabet[new_index] if new_index <= 27
    alphabet[new_index - 27]
  end
end