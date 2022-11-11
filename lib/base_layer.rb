require 'time'

module BaseLayer
  def random_key
    possibilities = Array('0'..'9')
    key_apart = []
    5.times { key_apart << possibilities.sample }
    key_apart.join
  end

  def today_date
    Time.now.strftime("%d%m%y").to_s.delete('/')
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
    key_split.each_with_index do |key_indv, index|
      unless index >= 4
        key_made << (([key_indv, key_split[index + 1]].join.to_i) + date_moved[index]) % 27
      end
    end
    key_made
  end
end