require './lib/enigma'
require './lib/base_layer'

RSpec.describe BaseLayer do
  let(:enigma) { Enigma.new }

  it 'can create an alphabet' do
    expect(enigma.alphabet).to eq(["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "])
  end

  it 'can create a random key if no key is passed in' do
    expect(enigma.random_key).to be_a String
    expect(enigma.random_key.length).to eq 5
  end

  it 'can get the information from the date needed to encrypt' do
    expect(enigma.date_mover("270597")).to eq([6, 4, 0, 9])
  end

  it 'can get the amount to move the character for all 1 through 4' do
    expect(enigma.key_maker('52138', '270597')).to eq([4, 25, 13, 20])
  end
  it 'can return todays date as a correctly formatted string' do
    date = Time.now.strftime("%D").to_s.delete("/")
    expect(enigma.today_date).to eq(date)
  end
end