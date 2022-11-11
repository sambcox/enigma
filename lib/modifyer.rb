module Modifyer
  def new_character(character, movement)
    new_index = alphabet.index(character) + movement
    if new_index <= 27
      alphabet[new_index]
    else
      alphabet[new_index - 27]
    end
  end
end