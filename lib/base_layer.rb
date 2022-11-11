module BaseLayer
  def random_key
    possibilities = Array('0'..'9')
    key_apart = []
    5.times { key_apart << possibilities.sample }
    key_apart.join
  end

  def alphabet
    Array('a'..'z').push(' ')
  end

  def date_mover(date)
    (date.to_i ** 2).digits.reverse.last(4)
  end

  def key_maker(key, date)
    date_moved = date_mover(date)
    key_split = key.split('')
    key_made = []
    key_made << ((key_split.first(2).join.to_i) + date_moved.first) % 27
    key_made << ((key_split[1, 2].join.to_i) + date_moved[1]) % 27
    key_made << (([key_split[2], key_split[3]].join.to_i) + date_moved[2]) % 27
    key_made << ((key_split[3, 4].join.to_i) + date_moved[3]) % 27
  end
end