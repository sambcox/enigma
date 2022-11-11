module BaseLayer
  def alphabet
    Array('a'..'z').push(' ')
  end

  def date_mover(date)
    (date.to_i ** 2).digits.reverse.last(4)
  end
end