# frozen_string_literal: true

require 'time'

module BaseLayer
  def random_key
    Array.new(5) { rand(9) }.join
  end

  def today_date
    Time.now.strftime('%d%m%y').to_s.delete('/')
  end

  def alphabet
    Array('a'..'z').push(' ')
  end

  def date_mover(date)
    (date.to_i**2).digits.reverse.last(4)
  end

  def key_maker(key, date)
    date_moved = date_mover(date)
    key.chars.filter_map.with_index do |key_indv, index|
      ([key_indv, key.chars[index + 1]].join.to_i + date_moved[index]) % 27 unless index >= 4
    end
  end
end
